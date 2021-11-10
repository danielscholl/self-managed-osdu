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

import logging

from airflow.models import BaseOperator, Variable
from osdu_api.libs.context import Context
from osdu_api.libs.refresh_token import AirflowTokenRefresher
from osdu_api.libs.search_record_ids import SearchId

logger = logging.getLogger()


class SearchRecordIdOperator(BaseOperator):
    """Operator to search files in SearchService by record ids.
    Expects "record_ids" field in xcom.
    """
    ui_color = '#10ECAA'
    ui_fgcolor = '#000000'

    FINISHED_STATUS = "finished"
    RUNNING_STATUS = "running"
    FAILED_STATUS = "failed"

    def execute(self, context: dict):
        """Execute update workflow status.
        If status assumed to be FINISHED then we check whether proceed files
        are searchable or not.
        If they are then update status FINISHED else FAILED

        :param context: Airflow dagrun context
        :type context: dict
        """
        payload_context = Context.populate(context["dag_run"].conf)
        record_ids = context["ti"].xcom_pull(key="record_ids", )
        ids_searcher = SearchId(Variable.get("core__service__search__url"), record_ids, AirflowTokenRefresher(),
                                payload_context)
        ids_searcher.check_records_searchable()
