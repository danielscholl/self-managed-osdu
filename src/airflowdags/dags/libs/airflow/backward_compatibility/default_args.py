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

import airflow


def update_default_args(default_args: dict) -> dict:
    """
    Update default args of tasks with necessary args depending on Airflow version
    :param default_args:
    :return:
    """
    if not airflow.__version__.startswith("2"):
        default_args.update(
            {
                "provide_context": True
            }
        )
        logging.warning(f"'provide_context' argument is going to be removed in Airflow 2.")
    else:
        logging.info(f"Airflow {airflow.__version__} is used. No need to update 'default_args'.")
    return default_args
