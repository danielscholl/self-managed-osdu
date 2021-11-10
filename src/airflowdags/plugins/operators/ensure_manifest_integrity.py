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

"""R3 Validate reference Manifest operator."""
import logging

from airflow.models import BaseOperator, Variable
from libs.airflow.backward_compatibility.airflow_utils import apply_defaults
from operators.mixins.ReceivingContextMixin import ReceivingContextMixin
from osdu_api.libs.context import Context
from osdu_api.libs.refresh_token import AirflowTokenRefresher
from osdu_api.libs.validation.validate_file_source import FileSourceValidator
from osdu_api.libs.validation.validate_referential_integrity import ManifestIntegrity

logger = logging.getLogger()


class EnsureManifestIntegrityOperator(BaseOperator, ReceivingContextMixin):
    """Operator to validate ref inside manifest R3 and remove invalid entities."""

    ui_color = '#dad5ff'
    ui_fgcolor = '#000000'

    @apply_defaults
    def __init__(self,
                 previous_task_id: str=None,
                 *args, **kwargs):
        """Init base operator and obtain base urls from Airflow Variables."""
        super().__init__(*args, **kwargs)
        self.search_url = Variable.get('core__service__search__url')
        self.previous_task_id = previous_task_id
        self._show_skipped_ids = Variable.get(
            'core__config__show_skipped_ids', default_var=False
        )

    def execute(self, context: dict):
        """Execute manifest validation then process it.

        :param context: Airflow context
        :type context: dict
        """
        payload_context = Context.populate(context["dag_run"].conf["execution_context"])
        token_refresher = AirflowTokenRefresher()
        file_source_validator = FileSourceValidator()

        manifest_integrity = ManifestIntegrity(
            self.search_url,
            token_refresher,
            file_source_validator,
            payload_context,
        )

        execution_context = context["dag_run"].conf["execution_context"]
        manifest_data = self._get_manifest_data(context, execution_context)
        logger.debug(f"Manifest data: {manifest_data}")

        manifest, skipped_ids = manifest_integrity.ensure_integrity(manifest_data)
        logger.debug(f"Valid manifest data: {manifest_data}")
        if self._show_skipped_ids:
            context["ti"].xcom_push(key="skipped_ids", value=skipped_ids)
        return {"manifest": manifest}
