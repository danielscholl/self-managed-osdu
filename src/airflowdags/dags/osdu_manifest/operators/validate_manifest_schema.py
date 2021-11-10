#  Copyright 2021 Google LLC
#  Copyright 2021 EPAM Systems
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
Validate Manifest against R3 schemas operator.
"""

import logging

from airflow.models import BaseOperator, Variable
from osdu_api.libs.constants import DATA_TYPES_WITH_SURROGATE_KEYS, SURROGATE_KEYS_PATHS
from osdu_api.libs.context import Context
from osdu_api.libs.exceptions import EmptyManifestError, GenericManifestSchemaError
from osdu_api.libs.refresh_token import AirflowTokenRefresher
from osdu_api.libs.validation.validate_schema import SchemaValidator
from osdu_manifest.libs.airflow.backward_compatibility.airflow_utils import apply_defaults
from osdu_manifest.operators.mixins.ReceivingContextMixin import ReceivingContextMixin

logger = logging.getLogger()


class ValidateManifestSchemaOperator(BaseOperator, ReceivingContextMixin):
    """Operator to validate manifest against definition schemasR3."""

    ui_color = '#dad5ff'
    ui_fgcolor = '#000000'

    @apply_defaults
    def __init__(self, previous_task_id: str = None, *args, **kwargs):
        """Init base operator and obtain base urls from Airflow Variables."""
        super().__init__(*args, **kwargs)
        self.previous_task_id = previous_task_id
        self.schema_service_url = Variable.get('core__service__schema__url')
        self._show_skipped_ids = Variable.get(
            'core__config__show_skipped_ids', default_var=False
        )

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

        schema_validator = SchemaValidator(
            self.schema_service_url,
            token_refresher,
            payload_context,
            surrogate_key_fields_paths=SURROGATE_KEYS_PATHS,
            data_types_with_surrogate_ids=DATA_TYPES_WITH_SURROGATE_KEYS
        )

        manifest_data = self._get_manifest_data(context, execution_context)
        logger.debug(f"Manifest data: {manifest_data}")

        if not manifest_data:
            raise EmptyManifestError(
                f"Data {context['dag_run'].conf} doesn't contain 'manifest field'")

        _ = schema_validator.validate_common_schema(manifest_data)
        try:
            valid_manifest_file, skipped_entities = schema_validator.ensure_manifest_validity(
                manifest_data
            )
        except GenericManifestSchemaError as err:
            context["ti"].xcom_push(key="skipped_ids", value=str(err))
            raise err
        if self._show_skipped_ids:
            context["ti"].xcom_push(key="skipped_ids", value=skipped_entities)
        return {"manifest": valid_manifest_file}
