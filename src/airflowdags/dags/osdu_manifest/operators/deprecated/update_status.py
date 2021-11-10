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

from airflow.models import BaseOperator, Variable
from osdu_api.libs.context import Context
from osdu_api.libs.exceptions import PipelineFailedError
from osdu_api.libs.refresh_token import AirflowTokenRefresher
from osdu_api.libs.update_status import UpdateStatus

logger = logging.getLogger()


class UpdateStatusOperator(BaseOperator):
    """Operator to update status."""
    ui_color = '#10ECAA'
    ui_fgcolor = '#000000'

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
        if "Payload" in conf:
            payload_context = Context.populate(conf)
        else:
            payload_context = Context(data_partition_id=conf["data-partition-id"],
                                      app_key=conf.get("AppKey", ""))
        workflow_id = conf["WorkflowID"]
        status = self.status.value
        status_updater = UpdateStatus(
            workflow_name="",
            workflow_url=Variable.get("core__service__workflow__url"),
            workflow_id=workflow_id,
            run_id="",
            status=status,
            token_refresher=AirflowTokenRefresher(),
            context=payload_context
        )
        status_updater.update_workflow_status()
        if self.status is self.prev_ti_state.FAILED:
            raise PipelineFailedError("Dag failed")
