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

"""DAG for R2 ingestion."""

from datetime import timedelta

import airflow
from airflow import DAG
from osdu_manifest.libs.airflow.backward_compatibility.default_args import update_default_args
from osdu_manifest.operators.deprecated.update_status import UpdateStatusOperator
from osdu_manifest.operators.process_manifest_r2 import ProcessManifestOperatorR2
from osdu_manifest.operators.search_record_id import SearchRecordIdOperator

default_args = {
    "start_date": airflow.utils.dates.days_ago(0),
    "retries": 0,
    "retry_delay": timedelta(minutes=50),
    "trigger_rule": "none_failed",
}

default_args = update_default_args(default_args)

workflow_name = "Osdu_ingest_r2"
dag = DAG(
    workflow_name,
    default_args=default_args,
    description="liveness monitoring dag",
    schedule_interval=None,
    dagrun_timeout=timedelta(minutes=60)
)

update_status_running_op = UpdateStatusOperator(
    task_id="update_status_running_task",
    dag=dag
)

update_status_finished_op = UpdateStatusOperator(
    task_id="update_status_finished_task",
    dag=dag,
    trigger_rule="all_done"
)

process_manifest_op = ProcessManifestOperatorR2(
    task_id="proccess_manifest_task",
    dag=dag
)

search_record_ids_op = SearchRecordIdOperator(
    task_id="search_record_ids_task",
    dag=dag,
    retries=1
)

update_status_running_op >> process_manifest_op >> \
search_record_ids_op >> update_status_finished_op  # pylint: disable=pointless-statement
