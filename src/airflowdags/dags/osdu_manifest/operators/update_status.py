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

"""Update Status operator."""

import copy
import enum
import logging
from typing import Tuple

from airflow.models import BaseOperator, Variable
from osdu_api.libs.context import Context
from osdu_api.libs.exceptions import PipelineFailedError
from osdu_api.libs.refresh_token import AirflowTokenRefresher
from osdu_api.libs.update_status import UpdateStatus
from osdu_manifest.libs.airflow.backward_compatibility.airflow_utils import apply_defaults

logger = logging.getLogger()


class UpdateStatusOperator(BaseOperator):
    """Operator to update status."""
    ui_color = '#10ECAA'
    ui_fgcolor = '#000000'

    @apply_defaults
    def __init__(self, *args, **kwargs):
        """Init base operator and obtain base urls from Airflow Variables."""
        super().__init__(*args, **kwargs)
        self._show_skipped_ids = Variable.get('core__config__show_skipped_ids', default_var=False)

    class prev_ti_state(enum.Enum):
        NONE = "running"
        SUCCESS = "finished"
        FAILED = "failed"

    def get_previous_ti_statuses(self, context: dict) -> enum.Enum:
        """Get status of previous tasks' executions.
        Return corresponding enum value.

        :param context: Airflow context
        :type context: dict
        :return: Previous status
        :rtype: enum.Enum
        """
        dagrun = context['ti'].get_dagrun()
        failed_ti = dagrun.get_task_instances(state='failed')
        success_ti = dagrun.get_task_instances(state='success')
        if not failed_ti and not success_ti:  # There is no prev task so it can't have been failed
            logger.info("There are no tasks before this one. So it has status RUNNING")
            return self.prev_ti_state.NONE
        if failed_ti:
            logger.info("There are failed tasks before this one. So it has status FAILED")
            return self.prev_ti_state.FAILED
        logger.info("There are successed tasks before this one. So it has status SUCCESSED")
        return self.prev_ti_state.SUCCESS

    def pre_execute(self, context: dict):
        self.status = self.get_previous_ti_statuses(context)

    def _create_skipped_report(self, context: dict) -> Tuple[dict, dict]:
        """
        Return aggregated report of skipped ids grouoped by tasks

        :param context:
        :return: Aggregated report grouped by tasks
        """
        skipped_ids_report = {}
        saved_record_ids = {}
        dagrun = context['ti'].get_dagrun()
        task_instances = dagrun.get_task_instances()
        for task in task_instances:
            task_skipped_ids = context["ti"].xcom_pull(key="skipped_ids", task_ids=task.task_id)
            if task_skipped_ids:
                skipped_ids_report[task.task_id] = task_skipped_ids

        for task in task_instances:
            task_saved_ids = context["ti"].xcom_pull(key="record_ids", task_ids=task.task_id)
            if task_saved_ids:
                saved_record_ids[task.task_id] = task_saved_ids
        return skipped_ids_report, saved_record_ids

    def execute(self, context: dict):
        """Execute update workflow status.
        If status assumed to be FINISHED then we check whether records
        are searchable or not.
        If they are then update status FINISHED else FAILED

        :param context: Airflow context
        :type context: dict
        :raises PipelineFailedError: If any of the status is failed
        """
        conf = copy.deepcopy(context["dag_run"].conf)
        logger.debug(f"Got conf {conf}.")
        execution_context = conf["execution_context"]
        if "Payload" in execution_context:
            payload_context = Context.populate(execution_context)
        else:
            payload_context = Context(data_partition_id=execution_context["data-partition-id"],
                                      app_key=execution_context.get("AppKey", ""))
        workflow_name = conf["workflow_name"]
        run_id = conf["run_id"]
        status = self.status.value
        status_updater = UpdateStatus(
            workflow_name=workflow_name,
            workflow_url=Variable.get("core__service__workflow__host"),
            workflow_id="",
            run_id=run_id,
            status=status,
            token_refresher=AirflowTokenRefresher(),
            context=payload_context
        )
        status_updater.update_workflow_status()

        if self._show_skipped_ids:
            skipped_ids, saved_record_ids = self._create_skipped_report(context)
            context["ti"].xcom_push(key="skipped_ids", value=skipped_ids)
            context["ti"].xcom_push(key="saved_record_ids", value=saved_record_ids)

        if self.status is self.prev_ti_state.FAILED:
            raise PipelineFailedError("Dag failed")
