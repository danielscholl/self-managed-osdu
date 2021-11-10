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

"""R2 Process Manifest operator."""

import configparser
import enum
import json
import logging
import re
import sys
import time
import uuid
from collections import Counter
from typing import Tuple
from urllib.error import HTTPError

import requests
import tenacity
from airflow.models import BaseOperator, Variable
from osdu_api.libs.auth.authorization import authorize
from osdu_api.libs.refresh_token import AirflowTokenRefresher

config = configparser.RawConfigParser()
config.read(Variable.get("core__config__dataload_config_path"))

DEFAULT_TENANT = config.get("DEFAULTS", "tenant")
DEFAULT_SOURCE = config.get("DEFAULTS", "authority")
DEFAULT_VERSION = config.get("DEFAULTS", "kind_version")

RETRIES = 3
TIMEOUT = 1

# Set up base logger
handler = logging.StreamHandler(sys.stdout)
handler.setFormatter(
    logging.Formatter("%(asctime)s [%(name)-14.14s] [%(levelname)-7.7s]  %(message)s"))
logger = logging.getLogger("Dataload")
logger.setLevel(logging.INFO)
logger.addHandler(handler)

# Some constants, used by script
SEARCH_OK_RESPONSE_CODES = [200]
DATA_LOAD_OK_RESPONSE_CODES = [201]
NOT_FOUND_RESPONSE_CODES = [404]
BAD_TOKEN_RESPONSE_CODES = [400, 401, 403, 500]


class FileType(enum.Enum):
    MANIFEST = enum.auto()
    WORKPRODUCT = enum.auto()


def dataload(**kwargs):
    data_conf = kwargs['dag_run'].conf
    conf_payload = kwargs["dag_run"].conf["Payload"]
    loaded_conf = {
        "acl": conf_payload["acl"],
        "legal_tag": conf_payload["legal"],
        "data_object": data_conf
    }
    return loaded_conf, conf_payload


def create_headers(conf_payload):
    """Create header.

    :param conf_payload: config payload
    :return: headers
    """
    partition_id = conf_payload["data-partition-id"]
    app_key = conf_payload["AppKey"]
    headers = {
        'Content-type': 'application/json',
        'data-partition-id': partition_id,
        'AppKey': app_key
    }
    return headers


def generate_id(type_id):
    """Generate resource ID.

    :param type_id: resource type ID
    :return: resource ID
    """
    return "{0}{1}:".format(type_id.replace("type:", ""), re.sub(r"\D", "", str(uuid.uuid4())))


def determine_data_type(raw_resource_type_id):
    """Determine resource type ID.

    :param raw_resource_type_id: raw resource type ID from manifest file
    :return: short resource type ID
    """
    return raw_resource_type_id.split("/")[-1].replace(":", "") \
        if raw_resource_type_id is not None else None


# TODO: add comments to functions that implement actions in this function
def process_file_items(loaded_conf, conf_payload) -> Tuple[list, list]:
    """Process files items.

    :param loaded_conf: loaded configuration
    :param conf_payload: configuration payload
    :return: list of file records and list of their ids
    """
    file_ids = []
    file_list = []
    data_object = loaded_conf.get("data_object")
    acl = loaded_conf.get("acl")
    legal_tag = loaded_conf.get("legal_tag")
    for file in data_object["Files"]:
        file["ResourceID"] = generate_id(file["ResourceTypeID"])
        file_ids.append(file["ResourceID"])
        file_list.append(
            (
                populate_request_body(file, acl, legal_tag, "file", conf_payload),
                "File"
            )
        )
    return file_list, file_ids


def process_wpc_items(loaded_conf, product_type, file_ids, conf_payload):
    """Process WorkProductComponents items.

    :param loaded_conf: loaded configuration
    :param product_type: product type
    :param file_ids: list of file ids
    :param conf_payload: configuration payload
    :return: list of workproductcomponents records and list of their ids
    """
    wpc_ids = []
    wpc_list = []
    data_object = loaded_conf.get("data_object")
    acl = loaded_conf.get("acl")
    legal_tag = loaded_conf.get("legal_tag")
    for wpc in data_object["WorkProductComponents"]:
        wpc["ResourceID"] = generate_id(wpc["ResourceTypeID"])
        wpc_ids.append(wpc["ResourceID"])
        wpc["Data"]["GroupTypeProperties"]["Files"] = file_ids
        wpc_list.append(
            (
                populate_request_body(wpc, acl, legal_tag, product_type + "_wpc", conf_payload),
                product_type + "_wpc"
            )
        )
    return wpc_list, wpc_ids


def process_wp_item(loaded_conf, product_type, wpc_ids, conf_payload) -> list:
    """Process WorkProduct item.

    :param loaded_conf: loaded configuration
    :param product_type: product type
    :param wpc_ids: work product component ids
    :param conf_payload: configuration payload
    :return: work product record
    """
    data_object = loaded_conf.get("data_object")
    acl = loaded_conf.get("acl")
    legal_tag = loaded_conf.get("legal_tag")

    work_product = data_object["WorkProduct"]
    work_product["ResourceID"] = generate_id(work_product["ResourceTypeID"])
    work_product["Data"]["GroupTypeProperties"]["Components"] = wpc_ids
    work_product = [
        (
            populate_request_body(work_product, acl, legal_tag, product_type + "_wp", conf_payload),
            product_type + "_wp"
        )
    ]
    return work_product


def validate_file_type(file_type, data_object):
    """Validate file type.

    :param file_type: file type
    :param data_object: file record
    """
    if not file_type:
        logger.error(f"Error with file {data_object}. Type could not be specified.")
        sys.exit(2)


def validate_file(loaded_conf) -> Tuple[FileType, str]:
    """Validate file.

    :param loaded_conf: loaded configuration
    :return: file type and produc type
    """
    data_object = loaded_conf.get("data_object")
    if not data_object:
        logger.error(f"Error with file {data_object}. It is empty.")
        sys.exit(2)
    elif "Manifest" in data_object and "ResourceTypeID" in data_object.get("Manifest"):
        product_type = determine_data_type(data_object["Manifest"].get("ResourceTypeID"))
        validate_file_type(product_type, data_object)
        return (FileType.MANIFEST, product_type)
    elif "WorkProduct" in data_object and "ResourceTypeID" in data_object.get("WorkProduct"):
        product_type = determine_data_type(data_object["WorkProduct"].get("ResourceTypeID"))
        validate_file_type(product_type, data_object)
        if product_type.lower() == "workproduct" and \
            data_object.get("WorkProductComponents") and \
            len(data_object["WorkProductComponents"]) >= 1:
            product_type = determine_data_type(
                data_object["WorkProductComponents"][0].get("ResourceTypeID"))
        validate_file_type(product_type, data_object)
        return (FileType.WORKPRODUCT, product_type)
    else:
        logger.error(
            f"Error with file {data_object}. It doesn't have either Manifest or WorkProduct or ResourceTypeID.")
        sys.exit(2)


def create_kind(data_kind, conf_payload):
    """Create kind.

    :param data_kind: data kind
    :param conf_payload: configuration payload
    :return: kind
    """
    partition_id = conf_payload.get("data-partition-id", DEFAULT_TENANT)
    source = conf_payload.get("authority", DEFAULT_SOURCE)
    version = conf_payload.get("kind_version", DEFAULT_VERSION)
    kind_init = config.get("KINDS_INITIAL", f"{data_kind.lower()}_kind")
    kind = f"{partition_id}:{source}:{kind_init}:{version}"
    return kind


def populate_request_body(data, acl, legal_tag, data_type, conf_payload):
    """Populate request body according API specification

    :param data: item data from manifest files
    :param data_type: resource type ID
    :return: populated request
    :rtype: dict
    """
    request = {"kind": create_kind(data_type, conf_payload),
               "legal": {
                   "legaltags": [],
                   "otherRelevantDataCountries": ["US"],
                   "status": "compliant"
               },
               "acl": {
                   "viewers": [],
                   "owners": []
               },
               "data": data}
    request["legal"]["legaltags"] = legal_tag["legaltags"]
    request["acl"]["viewers"] = acl["viewers"]
    request["acl"]["owners"] = acl["owners"]
    return request


def separate_type_data(request_data):
    """Separate the list of tuples into Data Type Counter and data list

    :param request_data: tuple of data and types
    :type request_data: tuple(list, str)
    :return: counter with data types and data list
    :rtype: tuple(counter, list)
    """
    data = []
    types = Counter()
    for elem in request_data:
        data.append(elem[0])
        types[elem[1]] += 1
    logger.info(f"The count of records to be ingested: {str(dict(types))}")
    return types, data


def create_manifest_request_data(loaded_conf: dict, product_type: str):
    acl = loaded_conf.get("acl")
    legal_tag = loaded_conf.get("legal_tag")
    data_object = loaded_conf.get("data_object")
    data_objects_list = [
        (
            populate_request_body(data_object["Manifest"], acl, legal_tag, product_type),
            product_type)]
    return data_objects_list


def create_workproduct_request_data(loaded_conf: dict, product_type: str, wp, wpc_list, file_list):
    data_object_list = file_list + wpc_list + wp
    types, data_objects_list = separate_type_data(data_object_list)
    return data_objects_list


@tenacity.retry(
    wait=tenacity.wait_fixed(TIMEOUT),
    stop=tenacity.stop_after_attempt(RETRIES),
    reraise=True
)
@authorize(AirflowTokenRefresher())
def send_request(headers, request_data):
    """Send request to records storage API."""

    logger.error(f"Header {str(headers)}")
    # loop for implementing retries send process
    retries = RETRIES

    for retry in range(retries):
        try:
            # send batch request for creating records
            response = requests.put(Variable.get('core__service__storage__url'), json.dumps(request_data),
                                    headers=headers)

            if response.status_code in DATA_LOAD_OK_RESPONSE_CODES:
                logger.info(",".join(map(str, response.json()["recordIds"])))
                return response

            reason = response.text[:250]
            logger.error(f"Request error.")
            logger.error(f"Response status: {response.status_code}. "
                         f"Response content: {reason}.")

            if retry + 1 < retries:
                if response.status_code in BAD_TOKEN_RESPONSE_CODES:
                    logger.error("Invalid or expired token.")
                    return response
                else:
                    time_to_sleep = TIMEOUT

                    logger.info(f"Retrying in {time_to_sleep} seconds...")
                    time.sleep(time_to_sleep)

        except (requests.RequestException, HTTPError) as exc:
            logger.error(f"Unexpected request error. Reason: {exc}")
            sys.exit(2)


    # End script if ran out of retries and data could not be uploaded.
    else:
        logger.error(f"Request could not be completed.\n"
                     f"Reason: {reason}")
        sys.exit(2)


def process_manifest(**kwargs):
    """Process manifest."""
    loaded_conf, conf_payload = dataload(**kwargs)
    file_type, product_type = validate_file(loaded_conf)
    if file_type is FileType.MANIFEST:
        manifest_record = create_manifest_request_data(loaded_conf, product_type)
    elif file_type is FileType.WORKPRODUCT:
        file_list, file_ids = process_file_items(loaded_conf, conf_payload)
        kwargs["ti"].xcom_push(key="file_ids", value=file_ids)
        wpc_list, wpc_ids = process_wpc_items(loaded_conf, product_type, file_ids, conf_payload)
        wp_list = process_wp_item(loaded_conf, product_type, wpc_ids, conf_payload)
        manifest_record = create_workproduct_request_data(loaded_conf, product_type, wp_list,
                                                          wpc_list,
                                                          file_list)
    else:
        sys.exit(2)
    headers = create_headers(conf_payload)
    record_ids = send_request(headers, request_data=manifest_record).json()["recordIds"]
    kwargs["ti"].xcom_push(key="record_ids", value=record_ids)


class ProcessManifestOperatorR2(BaseOperator):
    """R2 Manifest Operator."""
    ui_color = '#dad5ff'
    ui_fgcolor = '#000000'

    def execute(self, context):
        process_manifest(**context)
