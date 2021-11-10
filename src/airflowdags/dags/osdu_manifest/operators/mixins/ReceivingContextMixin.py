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

import logging

from osdu_api.libs.types import ManifestType


class ReceivingContextMixin:
    """Mixin for receiving manifest file from XCOMs in case if current operator not the first in the row"""

    def _get_manifest_data(self, context: dict, execution_context: dict) -> ManifestType:
        """
        Receive manifest file. If previous task id not None - get manifest file from XCOMs.
        Otherwise - get manifest file from execution context
        """
        if self.previous_task_id:
            previous_task_value = context["ti"].xcom_pull(task_ids=self.previous_task_id,
                                                          key="return_value")
            if previous_task_value:
                manifest_data = previous_task_value["manifest"]
            else:
                manifest_data = execution_context["manifest"]
        else:
            manifest_data = execution_context["manifest"]
        return manifest_data

    def _get_previously_skipped_entities(self, context: dict) -> list:
        """
        Receive skipped entities from previous tasks.
        """
        previously_skipped_ids = []
        dagrun = context['ti'].get_dagrun()
        task_instances = dagrun.get_task_instances()
        for task in task_instances:
            task_skipped_ids = context["ti"].xcom_pull(key="skipped_ids", task_ids=task.task_id)
            if task_skipped_ids:
                previously_skipped_ids.extend(task_skipped_ids)
        return previously_skipped_ids
