#  Copyright 2020 Google LLC
#  Copyright 2020 EPAM Systems
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.


"""
R3 Process Manifest operator.
"""

import logging
from math import ceil
from typing import List, Tuple

from airflow.models import BaseOperator, Variable
from jsonschema import SchemaError
from libs.airflow.backward_compatibility.airflow_utils import apply_defaults
from operators.mixins.ReceivingContextMixin import ReceivingContextMixin
from osdu_api.libs.constants import DATA_TYPES_WITH_SURROGATE_KEYS, SURROGATE_KEYS_PATHS
from osdu_api.libs.context import Context
from osdu_api.libs.exceptions import (EmptyManifestError, GenericManifestSchemaError,
                                      GetSchemaError, NotOSDUSchemaFormatError, UploadFileError)
from osdu_api.libs.handle_file import FileHandler
from osdu_api.libs.process_manifest_r3 import ManifestProcessor
from osdu_api.libs.processors.single_manifest_processor import SingleManifestProcessor
from osdu_api.libs.refresh_token import AirflowTokenRefresher
from osdu_api.libs.search_client import SearchClient
from osdu_api.libs.source_file_check import SourceFileChecker
from osdu_api.libs.types import ManifestType
from osdu_api.libs.validation.validate_file_source import FileSourceValidator
from osdu_api.libs.validation.validate_referential_integrity import ManifestIntegrity
from osdu_api.libs.validation.validate_schema import SchemaValidator
from requests import HTTPError

logger = logging.getLogger()


class ProcessManifestOperatorR3(BaseOperator, ReceivingContextMixin):
    """Operator to process manifest R3."""

    ui_color = '#dad5ff'
    ui_fgcolor = '#000000'

    @apply_defaults
    def __init__(self, previous_task_id: str = None, batch_number=3, *args, **kwargs):
        """Init base operator and obtain base urls from Airflow Variables."""
        super().__init__(*args, **kwargs)
        self.previous_task_id = previous_task_id
        self.batch_number = batch_number
        self.schema_service_url = Variable.get('core__service__schema__url')
        self.search_service_url = Variable.get('core__service__search__url')
        self.storage_url = Variable.get('core__service__storage__url')
        self.file_service_host = Variable.get('core__service__file__host')
        self.batch_count = int(Variable.get("core__ingestion__batch_count", "3"))
        self._show_skipped_ids = Variable.get('core__config__show_skipped_ids', default_var=False)

    def _get_manifest_files_range(self, manifests: List[dict]) -> Tuple[int, int]:
        """
        Get start and end indexes of a manifest files slice to be processed within this task.
        :param manifests: A list of manifests
        :return: start index, end index
        """
        split_size = ceil(len(manifests) / self.batch_count)
        slice_start_index = (self.batch_number - 1) * split_size
        slice_end_index = self.batch_number * split_size
        return slice_start_index, slice_end_index

    def _process_manifest(
        self,
        single_manifest_processor: SingleManifestProcessor,
        manifest: ManifestType
    ) -> Tuple[List[str], List[dict]]:
        """

        :param single_manifest_processor: Object to process a single manifest file.
        Processing includes validation against schemas, storing records enc.
        :param manifest: A single manifest file or a list of them.
        :return:
        """
        skipped_entities = []
        if isinstance(manifest, dict):
            record_ids, skipped_entities = single_manifest_processor.process_manifest(
                manifest, False)

        elif isinstance(manifest, list):
            record_ids = []
            slice_start_index, slice_end_index = self._get_manifest_files_range(manifest)
            logger.debug(f"Start and indexes {slice_start_index}:{slice_end_index}")
            for single_manifest in manifest[slice_start_index:slice_end_index]:
                logger.debug(f"processing {single_manifest}")
                try:
                    saved_records_ids, not_saved_records = single_manifest_processor.process_manifest(
                        single_manifest, True
                    )
                    record_ids.extend(saved_records_ids)
                    skipped_entities.extend(not_saved_records)
                except (UploadFileError, HTTPError, GetSchemaError, SchemaError,
                        GenericManifestSchemaError) as e:
                    logger.error(f"Can't process {single_manifest}")
                    logger.error(e)
                    continue
        else:
            raise NotOSDUSchemaFormatError(
                f"Manifest {manifest} must be either not empty 'list' or 'dict'")

        return record_ids, skipped_entities

    def execute(self, context: dict):
        """Execute manifest validation then process it.

        Get a single manifest file or a list of them.
        If it is a list, calculate which range (slice) of manifest files must be processed and then
        process this range one by one.

        :param context: Airflow context
        :type context: dict
        """
        execution_context = context["dag_run"].conf["execution_context"]
        payload_context = Context.populate(execution_context)
        token_refresher = AirflowTokenRefresher()
        file_handler = FileHandler(self.file_service_host, token_refresher, payload_context)
        file_source_validator = FileSourceValidator()
        search_client = SearchClient(self.search_service_url, token_refresher, payload_context)
        source_file_checker = SourceFileChecker()

        referential_integrity_validator = ManifestIntegrity(
            self.search_service_url,
            token_refresher,
            file_source_validator,
            payload_context
        )

        manifest_processor = ManifestProcessor(
            storage_url=self.storage_url,
            file_handler=file_handler,
            token_refresher=token_refresher,
            context=payload_context,
            source_file_checker=source_file_checker,
        )
        validator = SchemaValidator(
            self.schema_service_url,
            token_refresher,
            payload_context,
            data_types_with_surrogate_ids=DATA_TYPES_WITH_SURROGATE_KEYS,
            surrogate_key_fields_paths=SURROGATE_KEYS_PATHS
        )
        single_manifest_processor = SingleManifestProcessor(
            storage_url=self.storage_url,
            payload_context=payload_context,
            referential_integrity_validator=referential_integrity_validator,
            manifest_processor=manifest_processor,
            schema_validator=validator,
            token_refresher=token_refresher,
        )

        manifest_data = self._get_manifest_data(context, execution_context)
        logger.debug(f"Manifest data: {manifest_data}")

        if not manifest_data:
            raise EmptyManifestError(
                f"Data {context['dag_run'].conf} doesn't contain 'manifest field'")
        record_ids, skipped_ids = self._process_manifest(single_manifest_processor, manifest_data)
        logger.info(f"Processed ids {record_ids}")
        context["ti"].xcom_push(key="record_ids", value=record_ids)
        if self._show_skipped_ids:
            context["ti"].xcom_push(key="skipped_ids", value=skipped_ids)
