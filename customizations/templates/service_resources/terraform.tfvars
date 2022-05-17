//  Copyright © Microsoft Corporation
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

/*
.Synopsis
   Terraform Variable Configuration
.DESCRIPTION
   This file holds the Default Variable Configuration
*/

/*
The following items are recommended to override in custom.tfvars

1. Resource Tags
2. Kubernetes Version  ** Lock your version and manage your upgrades.
3. Agent VM Size       ** Current Default Recomendation.
4. Agent VM Count      ** Size as appropriate
5. Agent VM Disk       ** Size as appropriate
6. Feature Flags       ** Configure as desired

*/


prefix = "osdu-mvp"

resource_tags = {
  contact = "pipeline"
}

# Kubernetes Settings
kubernetes_version = "1.21.9"
aks_agent_vm_size  = "Standard_E4s_v3"
aks_agent_vm_count = "5"
aks_agent_vm_disk  = 128
subnet_aks_prefix  = "10.10.2.0/23"

# Storage Settings
storage_replication_type = "LRS"
storage_containers = [
  "azure-webjobs-hosts"
]

system_storage_containers = [
  "opendes"
]

storage_shares = [
  "unit",
  "crs",
  "crs-conversion"
]
storage_queues = []

# Feature Toggles
feature_flag = {
  osdu_namespace = true
  flux           = true
  sa_lock        = true
  autoscaling    = false
}

# Feature flag for keda v2
keda_v2_enabled = false

# cosmos DB SQL collections
cosmos_sql_collections = [
  {
    name                  = "Authority"
    database_name         = "osdu-system-db"
    partition_key_path    = "/id"
    partition_key_version = null

  },
  {
    name                  = "EntityType"
    database_name         = "osdu-system-db"
    partition_key_path    = "/id"
    partition_key_version = null
  },
  {
    name                  = "SchemaInfo"
    database_name         = "osdu-system-db"
    partition_key_path    = "/partitionId"
    partition_key_version = null
  },
  {
    name                  = "Source"
    database_name         = "osdu-system-db"
    partition_key_path    = "/id"
    partition_key_version = null
  },
  {
    name                  = "WorkflowV2"
    database_name         = "osdu-system-db"
    partition_key_path    = "/partitionKey"
    partition_key_version = 2
  },
]

# Database Settings
cosmosdb_consistency_level = "Session"
cosmos_databases = [
  {
    name       = "osdu-system-db"
    throughput = 12000
  }
]
