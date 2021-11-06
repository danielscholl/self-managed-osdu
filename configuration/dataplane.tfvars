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

feature_flag = {
  osdu_namespace = false
  flux           = false
  sa_lock        = false
  autoscaling    = false
}
keda_v2_enabled = false

resource_tags = {
  environment = "Self Managed OSDU"
  contact = "<your_name>"
  repo = "https://github.dev/danielscholl/self-managed-osdu"
}

# Network Addressing
address_space      = "10.10.0.0/16"
subnet_fe_prefix   = "10.10.1.0/26"
subnet_aks_prefix  = "10.10.2.0/23"
subnet_be_prefix   = "10.10.3.0/28"

# Kubernetes Settings
kubernetes_version = "1.19.13"

aks_agent_vm_size           = "Standard_E4s_v3"
aks_agent_vm_count          = "5"
aks_agent_vm_disk           = 128
aks_services_agent_vm_size  = "Standard_E4s_v3"
aks_services_agent_vm_count = "5"
aks_services_agent_vm_disk  = 128


/* The below items are not typically modified */

# Storage Settings
storage_replication_type = "LRS"

# Database Settings
cosmosdb_consistency_level = "Session"
cosmos_databases = [
  {
    name       = "osdu-system-db"
    throughput = 4000
  }
]
