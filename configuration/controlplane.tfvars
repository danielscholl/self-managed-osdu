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
  contact = "mpcheema"
  repo = "https://github.com/mpcheema/self-managed-osdu"
}

/* The below items are not typically modified */

feature_flag = {
  acr_lock = false
  kv_lock  = false
}

# Storage Settings
storage_replication_type = "LRS"

# Database Settings
cosmosdb_consistency_level = "Session"
cosmos_graph_databases = [
  {
    name       = "osdu-graph"
    throughput = 4000
  }
]
