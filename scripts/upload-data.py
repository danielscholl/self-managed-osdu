#   Copyright © Microsoft Corporation
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.


from azure.cosmos import CosmosClient, PartitionKey
import json
import pprint
import os
import time

cosmos_url = os.environ['COSMOS_ENDPOINT']
cosmos_key = os.environ['COSMOS_KEY']
service_principal_id = os.environ['SERVICE_PRINCIPAL_ID']
service_principal_oid = os.environ['SERVICE_PRINCIPAL_OID']
partition_name = os.environ['PARTITION_NAME']

cosmos_client = CosmosClient(cosmos_url, credential = cosmos_key)
db = cosmos_client.get_database_client('osdu-db')

def tenant_info(db):
    container = db.get_container_client("TenantInfo")
    with open("configuration/tenant_info.json", "r") as f :
      tenant_info = json.load(f)
    tenant_info["serviceprincipalAppId"] = service_principal_id
    tenant_info["id"] = partition_name
    container.upsert_item(tenant_info)
    return

if __name__ == "__main__":
    tenant_info(db)
