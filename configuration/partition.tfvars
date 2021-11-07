/*
.Synopsis
   Terraform Variable Override Template
.DESCRIPTION
   This file holds a sample of variable overrides to be used by pipelines
*/

/* The following items are recommended to override in custom.tfvars
  1. Resource Tags
*/

prefix = "osdu-self"

resource_tags = {
  environment = "Self Managed OSDU"
  contact = "<your_name>"
  repo = "https://github.dev/danielscholl/self-managed-osdu"
}

data_partition_name = "opendes"


# Database Settings
cosmosdb_consistency_level = "Session"
cosmos_databases = [
  {
    name       = "osdu-db"
    throughput = 12000
  }
]

# Storage Settings
storage_replication_type = "GZRS"
sa_retention_days        = 30
