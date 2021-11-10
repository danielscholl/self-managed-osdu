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

""" Mock airflow.utils"""

import logging
from typing import Callable

import airflow


def deprecated_function_decorator(func: Callable):
    """
    This decorator is used to mock deprecated decorators if we use Airflow 2.0

    :param func:
    :return:
    """
    def wrapper(*args, **kwargs):
        return func(*args, **kwargs)

    return wrapper


if not airflow.__version__.startswith("2"):
    logging.warning(f"'apply_defaults' is going to be removed in Airflow 2. Do not use it in the future.")
    from airflow.utils import apply_defaults
else:
    logging.warning(f"'apply_defaults' is removed in Airflow 2. "
                    f"It is used here due to backward compatibility.")
    apply_defaults = deprecated_function_decorator


