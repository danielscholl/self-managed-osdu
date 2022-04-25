/*
.Synopsis
   Terraform Variable Override Template
.DESCRIPTION
   This file holds a variable override sample to be used by pipelines
*/

/* The following items are recommended to override in custom.tfvars
  1. Resource Tags
  2. Network Addressing
  2. Kubernetes Version  ** Lock your version and manage your upgrades.
  3. Agent VM Size       ** Current Default Recomendation.
  4. Agent VM Count      ** Size as appropriate
  5. Agent VM Disk       ** Size as appropriate
*/

prefix = "osdu-self"

resource_tags = {
  environment = "Self Managed OSDU"
  contact = "mpcheema"
  repo = "https://github.com/mpcheema/self-managed-osdu"
}

# Network Addressing
address_space     = "10.10.0.0/16"
subnet_fe_prefix  = "10.10.1.0/26"
subnet_aks_prefix = "10.10.2.0/23"
subnet_be_prefix  = "10.10.3.0/28"

# Kubernetes Settings
kubernetes_version = "1.20.9"
aks_agent_vm_count = "6"
aks_agent_vm_disk  = 128
aks_agent_vm_size  = "Standard_E4s_v3"

# Database Settings
cosmos_databases = [
  {
    name       = "osdu-system-db"
    throughput = 4000
  }
]

# Storage Settings
storage_replication_type = "LRS"


/**********************************************/
/* The below items are not typically modified */
/**********************************************/

# Storage Settings
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
  osdu_namespace = false
  flux           = false
  sa_lock        = false
  autoscaling    = false
}

# Feature flag for keda v2
keda_v2_enabled = false

# cosmos DB SQL
cosmosdb_consistency_level = "Session"
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
