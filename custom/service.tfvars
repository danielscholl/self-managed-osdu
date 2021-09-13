/*
.Synopsis
   Terraform Variable Override Template
.DESCRIPTION
   This file holds a variable override sample to be used by pipelines
*/


feature_flag = {
  osdu_namespace = false
  flux           = false
  sa_lock        = false
  autoscaling    = false
}

keda_v2_enabled = false

prefix = "osdu-self"

resource_tags = {
  environment = "Self Managed OSDU"
}

# Kubernetes Settings
kubernetes_version = "1.19.11"
aks_agent_vm_size  = "Standard_D2s_v3"
aks_agent_vm_count = "3"
subnet_aks_prefix  = "10.10.2.0/23"

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

blob_cors_rule = [
  {
    allowed_headers    = ["*"]
    allowed_origins    = ["https://osdu-self.contoso.org"]
    allowed_methods    = ["GET", "HEAD", "POST", "PUT", "DELETE"]
    exposed_headers    = ["*"]
    max_age_in_seconds = 3600
  }
]
