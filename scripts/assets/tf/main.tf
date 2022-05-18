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
   Terraform Main Control
.DESCRIPTION
   This file holds the main control and resoures for bootstraping an OSDU Azure Devops Project.
*/

terraform {
  required_version = ">= 0.14"

  backend "azurerm" {
    key = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.98.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "=1.1.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "=2.3.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "=3.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.13.3"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "=2.0.1"
    }
  }
}


#-------------------------------
# Providers
#-------------------------------
provider "azurerm" {
  features {}
}

// Hook-up kubectl Provider for Terraform
provider "kubernetes" {
  load_config_file       = false
  host                   = module.aks.kube_config_block.0.host
  username               = module.aks.kube_config_block.0.username
  password               = module.aks.kube_config_block.0.password
  client_certificate     = base64decode(module.aks.kube_config_block.0.client_certificate)
  client_key             = base64decode(module.aks.kube_config_block.0.client_key)
  cluster_ca_certificate = base64decode(module.aks.kube_config_block.0.cluster_ca_certificate)
}

// Hook-up helm Provider for Terraform
provider "helm" {
  kubernetes {
    host                   = module.aks.kube_config_block.0.host
    username               = module.aks.kube_config_block.0.username
    password               = module.aks.kube_config_block.0.password
    client_certificate     = base64decode(module.aks.kube_config_block.0.client_certificate)
    client_key             = base64decode(module.aks.kube_config_block.0.client_key)
    cluster_ca_certificate = base64decode(module.aks.kube_config_block.0.cluster_ca_certificate)
  }
}



#-------------------------------
# Private Variables
#-------------------------------
locals {
  // sanitize names
  prefix    = replace(trimspace(lower(var.prefix)), "_", "-")
  workspace = replace(trimspace(lower(terraform.workspace)), "-", "")
  suffix    = var.randomization_level > 0 ? "-${random_string.workspace_scope.result}" : ""

  // base prefix for resources, prefix constraints documented here: https://docs.microsoft.com/en-us/azure/architecture/best-practices/naming-conventions
  base_name    = length(local.prefix) > 0 ? "${local.prefix}-${local.workspace}${local.suffix}" : "${local.workspace}${local.suffix}"
  base_name_21 = length(local.base_name) < 22 ? local.base_name : "${substr(local.base_name, 0, 21 - length(local.suffix))}${local.suffix}"
  base_name_46 = length(local.base_name) < 47 ? local.base_name : "${substr(local.base_name, 0, 46 - length(local.suffix))}${local.suffix}"
  base_name_60 = length(local.base_name) < 61 ? local.base_name : "${substr(local.base_name, 0, 60 - length(local.suffix))}${local.suffix}"
  base_name_76 = length(local.base_name) < 77 ? local.base_name : "${substr(local.base_name, 0, 76 - length(local.suffix))}${local.suffix}"
  base_name_83 = length(local.base_name) < 84 ? local.base_name : "${substr(local.base_name, 0, 83 - length(local.suffix))}${local.suffix}"

  tenant_id           = data.azurerm_client_config.current.tenant_id
  resource_group_name = format("%s-%s-%s-rg", var.prefix, local.workspace, random_string.workspace_scope.result)
  retention_policy    = var.log_retention_days == 0 ? false : true

  storage_name        = "${replace(local.base_name_21, "-", "")}config"
  system_storage_name = "${replace(local.base_name_21, "-", "")}data"

  redis_cache_name = "${local.base_name}-cache"
  redis_queue_name = "${local.base_name}-queue"
  postgresql_name  = "${local.base_name}-pg"

  vnet_name           = "${local.base_name_60}-vnet"
  fe_subnet_name      = "${local.base_name_21}-fe-subnet"
  aks_subnet_name     = "${local.base_name_21}-aks-subnet"
  be_subnet_name      = "${local.base_name_21}-be-subnet"
  app_gw_name         = "${local.base_name_60}-gw"
  istio_app_gw_name   = "${local.base_name_21}-istio-gw"
  appgw_identity_name = format("%s-agic-identity", local.app_gw_name)


  aks_cluster_name  = "${local.base_name_60}-aks"
  aks_identity_name = format("%s-pod-identity", local.aks_cluster_name)
  aks_dns_prefix    = local.base_name_60
  cosmosdb_name     = "${local.base_name}-system-db"

  nodepool_zones = [
    "1",
    "2"
  ]

  gateway_zones = [
    "1",
    "2"
  ]

  role = "Contributor"
  rbac_principals = [
    // OSDU Identity
    data.terraform_remote_state.central_resources.outputs.osdu_identity_principal_id,

    // Service Principal
    data.terraform_remote_state.central_resources.outputs.principal_objectId
  ]
}



#-------------------------------
# Common Resources
#-------------------------------
data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

data "terraform_remote_state" "central_resources" {
  backend = "azurerm"

  config = {
    storage_account_name = var.remote_state_account
    container_name       = var.remote_state_container
    key                  = format("terraform.tfstateenv:%s", var.central_resources_workspace_name)
  }
}

resource "random_string" "workspace_scope" {
  keepers = {
    # Generate a new id each time we switch to a new workspace or app id
    ws_name    = replace(trimspace(lower(terraform.workspace)), "_", "-")
    cluster_id = replace(trimspace(lower(var.prefix)), "_", "-")
  }

  length  = max(1, var.randomization_level) // error for zero-length
  special = false
  upper   = false
}


#-------------------------------
# Resource Group
#-------------------------------
resource "azurerm_resource_group" "main" {
  name     = local.resource_group_name
  location = var.resource_group_location

  tags = var.resource_tags

  lifecycle {
    ignore_changes = [tags]
  }
}


#-------------------------------
# User Assigned Identities
#-------------------------------

// Create an Identity for Pod Identity
resource "azurerm_user_assigned_identity" "podidentity" {
  name                = local.aks_identity_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
}

// Create and Identity for AGIC
resource "azurerm_user_assigned_identity" "agicidentity" {
  name                = local.appgw_identity_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
}



#-------------------------------
# Storage
#-------------------------------
module "storage_account" {
  source = "../../../modules/providers/azure/storage-account"

  name                = local.storage_name
  resource_group_name = azurerm_resource_group.main.name
  container_names     = var.storage_containers
  share_names         = var.storage_shares
  queue_names         = var.storage_queues
  kind                = "StorageV2"
  replication_type    = var.storage_replication_type

  resource_tags = var.resource_tags
}

// Add Contributor Role Access
resource "azurerm_role_assignment" "storage_access" {
  count = length(local.rbac_principals)

  role_definition_name = local.role
  principal_id         = local.rbac_principals[count.index]
  scope                = module.storage_account.id
}

// Add Storage Queue Data Reader Role Access
resource "azurerm_role_assignment" "queue_reader" {
  count = length(local.rbac_principals)

  role_definition_name = "Storage Queue Data Reader"
  principal_id         = local.rbac_principals[count.index]
  scope                = module.storage_account.id
}

// Add Storage Queue Data Message Processor Role Access
resource "azurerm_role_assignment" "airflow_log_queue_processor_roles" {
  count = length(local.rbac_principals)

  role_definition_name = "Storage Queue Data Message Processor"
  principal_id         = local.rbac_principals[count.index]
  scope                = module.storage_account.id
}

resource "azurerm_role_assignment" "storage_blob_contributor" {
  count = length(local.rbac_principals)

  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = local.rbac_principals[count.index]
  scope                = module.storage_account.id
}

module "system_storage_account" {
  source = "../../../modules/providers/azure/storage-account"

  name                = local.system_storage_name
  resource_group_name = azurerm_resource_group.main.name
  container_names     = var.system_storage_containers
  kind                = "StorageV2"
  replication_type    = var.storage_replication_type

  resource_tags  = var.resource_tags
  blob_cors_rule = var.blob_cors_rule
}

// Add Contributor Role Access
resource "azurerm_role_assignment" "system_storage_access" {
  count = length(local.rbac_principals)

  role_definition_name = local.role
  principal_id         = local.rbac_principals[count.index]
  scope                = module.system_storage_account.id
}

// Add Data Contributor Role to Principal
resource "azurerm_role_assignment" "system_storage_data_contributor" {
  count      = length(local.rbac_principals)
  depends_on = [azurerm_role_assignment.system_storage_access]

  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = local.rbac_principals[count.index]
  scope                = module.system_storage_account.id
}


#-------------------------------
# Network
#-------------------------------
module "network-existing" {
  source = "../../../modules/providers/azure/network-existing"

  existing_vnet_resource_group_name = rg-osdu
  existing_virtual_network_name = vnet-odu
  existing_subnet_name_fe = snfe
  existing_subnet_name_aks = snaks
}

module "appgateway" {
  source = "../../../modules/providers/azure/appgw"

  name                = local.app_gw_name
  resource_group_name = azurerm_resource_group.main.name

  vnet_name                       = module.network-existing.name
  vnet_subnet_id                  = module.network-existing.subnet_fe
  keyvault_id                     = data.terraform_remote_state.central_resources.outputs.keyvault_id
  keyvault_secret_id              = azurerm_key_vault_certificate.default.0.secret_id
  ssl_certificate_name            = local.ssl_cert_name
  ssl_policy_type                 = var.ssl_policy_type
  ssl_policy_cipher_suites        = var.ssl_policy_cipher_suites
  ssl_policy_min_protocol_version = var.ssl_policy_min_protocol_version

  resource_tags = var.resource_tags
  min_capacity  = var.appgw_min_capacity
  max_capacity  = var.appgw_max_capacity
  http_enabled  = true

  depends_on = [azurerm_key_vault_certificate.default]
}

module "istio_appgateway" {
  count = var.feature_flag.autoscaling ? 1 : 0

  source = "../../../modules/providers/azure/appgw"

  name                = local.istio_app_gw_name
  resource_group_name = azurerm_resource_group.main.name

  vnet_name                       = module.network-existing.name
  vnet_subnet_id                  = module.network-existing.subnet_fe
  keyvault_id                     = data.terraform_remote_state.central_resources.outputs.keyvault_id
  keyvault_secret_id              = azurerm_key_vault_certificate.default.0.secret_id
  ssl_certificate_name            = local.ssl_cert_name
  ssl_policy_type                 = var.ssl_policy_type
  ssl_policy_cipher_suites        = var.ssl_policy_cipher_suites
  ssl_policy_min_protocol_version = var.ssl_policy_min_protocol_version
  backend_address_pool_ips        = var.istio_int_load_balancer_ip == "" ? null : [var.istio_int_load_balancer_ip]

  gateway_zones = local.gateway_zones

  resource_tags   = var.resource_tags
  min_capacity    = var.istio_appgw_min_capacity
  max_capacity    = var.istio_appgw_max_capacity
  host_name       = var.aks_dns_host
  request_timeout = 300
}

// Give AGIC Identity Access rights to Change the Application Gateway
resource "azurerm_role_assignment" "appgwcontributor" {
  principal_id         = azurerm_user_assigned_identity.agicidentity.principal_id
  scope                = module.appgateway.id
  role_definition_name = "Contributor"

}

// Give AGIC Identity the rights to look at the Resource Group
resource "azurerm_role_assignment" "agic_resourcegroup_reader" {
  principal_id         = azurerm_user_assigned_identity.agicidentity.principal_id
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Reader"
}

// Give AGIC Identity rights to Operate the Gateway Identity
resource "azurerm_role_assignment" "agic_app_gw_mi" {
  principal_id         = azurerm_user_assigned_identity.agicidentity.principal_id
  scope                = module.appgateway.managed_identity_resource_id
  role_definition_name = "Managed Identity Operator"
}

#-------------------------------
# Azure AKS
#-------------------------------
module "aks" {
  source = "../../../modules/providers/azure/aks"

  name                = local.aks_cluster_name
  resource_group_name = azurerm_resource_group.main.name

  dns_prefix         = local.aks_dns_prefix
  availability_zones = local.nodepool_zones
  agent_vm_count     = var.aks_agent_vm_count
  agent_vm_size      = var.aks_agent_vm_size
  agent_vm_disk      = var.aks_agent_vm_disk
  max_node_count     = var.aks_agent_vm_maxcount
  vnet_subnet_id     = module.network-existing.subnet_aks
  ssh_public_key     = file(var.ssh_public_key_file)
  kubernetes_version = var.kubernetes_version
  log_analytics_id   = data.terraform_remote_state.central_resources.outputs.log_analytics_id

  msi_enabled               = true
  oms_agent_enabled         = true
  auto_scaling_default_node = true
  kubeconfig_to_disk        = false
  azure_policy_enabled      = true

  resource_tags = var.resource_tags
}

resource "azurerm_kubernetes_cluster_node_pool" "services" {
  count = var.feature_flag.autoscaling ? 1 : 0

  name                  = "services"
  kubernetes_cluster_id = module.aks.id
  node_count            = var.aks_services_agent_vm_count
  min_count             = var.aks_services_agent_vm_count
  max_count             = var.aks_services_agent_vm_maxcount
  availability_zones    = local.nodepool_zones
  vnet_subnet_id        = module.network-existing.subnet_aks
  orchestrator_version  = var.kubernetes_version
  vm_size               = var.aks_services_agent_vm_size
  os_disk_size_gb       = var.aks_services_agent_vm_disk
  enable_auto_scaling   = true
  max_pods              = var.max_pods
  node_labels           = { nodepool = "services" }

  tags = var.resource_tags
}

data "azurerm_resource_group" "aks_node_resource_group" {
  name = module.aks.node_resource_group
}

// Give AD Principal Access rights to Change the Istio Application Gateway
resource "azurerm_role_assignment" "agic_istio_appgw_contributor" {
  count = var.feature_flag.autoscaling ? 1 : 0

  principal_id         = data.terraform_remote_state.central_resources.outputs.osdu_service_principal_id
  scope                = module.istio_appgateway[count.index].id
  role_definition_name = "Contributor"

  depends_on = [module.istio_appgateway]
}

// Give AD Principal Access rights to Operate the Istio Application Gateway Identity
resource "azurerm_role_assignment" "agic_istio_app_gw_contributor_for_adsp" {
  count = var.feature_flag.autoscaling ? 1 : 0

  principal_id         = data.terraform_remote_state.central_resources.outputs.osdu_service_principal_id
  scope                = module.istio_appgateway[count.index].managed_identity_resource_id
  role_definition_name = "Managed Identity Operator"

  depends_on = [module.istio_appgateway]
}

// Give AD Principal the rights to look at the Resource Group
resource "azurerm_role_assignment" "agic_istio_resourcegroup_reader" {
  count = var.feature_flag.autoscaling ? 1 : 0

  principal_id         = data.terraform_remote_state.central_resources.outputs.osdu_service_principal_id
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Reader"

  depends_on = [module.istio_appgateway]
}

// Give AKS Access rights to Operate the Node Resource Group
resource "azurerm_role_assignment" "all_mi_operator" {
  principal_id         = module.aks.kubelet_object_id
  scope                = data.azurerm_resource_group.aks_node_resource_group.id
  role_definition_name = "Managed Identity Operator"
}

// Give AKS Access to Create and Remove VM's in Node Resource Group
resource "azurerm_role_assignment" "vm_contributor" {
  principal_id         = module.aks.kubelet_object_id
  scope                = data.azurerm_resource_group.aks_node_resource_group.id
  role_definition_name = "Virtual Machine Contributor"
}

// Give AKS Access to Operate the Network
resource "azurerm_role_assignment" "subnet_contributor" {
  count = var.feature_flag.autoscaling ? 1 : 0

  principal_id         = module.aks.principal_id
  scope                = module.network-existing.subnet_aks
  role_definition_name = "Contributor"
}

// Give AKS Access to Pull from ACR
resource "azurerm_role_assignment" "acr_reader" {
  principal_id         = module.aks.kubelet_object_id
  scope                = data.terraform_remote_state.central_resources.outputs.container_registry_id
  role_definition_name = "AcrPull"
}

// Give AKS Rights to operate the AGIC Identity
resource "azurerm_role_assignment" "mi_ag_operator" {
  principal_id         = module.aks.kubelet_object_id
  scope                = azurerm_user_assigned_identity.agicidentity.id
  role_definition_name = "Managed Identity Operator"
}

// Give AKS Access Rights to operate the Pod Identity
resource "azurerm_role_assignment" "mi_operator" {
  principal_id         = module.aks.kubelet_object_id
  scope                = azurerm_user_assigned_identity.podidentity.id
  role_definition_name = "Managed Identity Operator"
}

// Give AKS Access Rights to operate the OSDU Identity
resource "azurerm_role_assignment" "osdu_identity_mi_operator" {
  principal_id         = module.aks.kubelet_object_id
  scope                = data.terraform_remote_state.central_resources.outputs.osdu_identity_id
  role_definition_name = "Managed Identity Operator"
}

# // Give AD Principal Access rights to AKS cluster
resource "azurerm_role_assignment" "aks_contributor" {
  count = var.feature_flag.autoscaling ? 1 : 0

  principal_id         = data.terraform_remote_state.central_resources.outputs.osdu_service_principal_id
  scope                = module.aks.id
  role_definition_name = "Contributor"
}

#-------------------------------
# PostgreSQL
#-------------------------------
resource "random_password" "postgres" {
  count = var.postgres_password == "" ? 1 : 0

  length           = 8
  special          = true
  override_special = "_%@"
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
}

module "postgreSQL" {
  source = "../../../modules/providers/azure/postgreSQL"

  resource_group_name       = azurerm_resource_group.main.name
  name                      = local.postgresql_name
  databases                 = var.postgres_databases
  admin_user                = var.postgres_username
  admin_password            = local.postgres_password
  sku                       = var.postgres_sku
  postgresql_configurations = var.postgres_configurations

  storage_mb                   = 5120
  server_version               = "10.0"
  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true
  ssl_enforcement_enabled      = true

  public_network_access = true
  firewall_rules = [{
    start_ip = "0.0.0.0"
    end_ip   = "0.0.0.0"
  }]

  resource_tags = var.resource_tags
}

// Add Contributor Role Access
resource "azurerm_role_assignment" "postgres_access" {
  count = length(local.rbac_principals)

  role_definition_name = local.role
  principal_id         = local.rbac_principals[count.index]
  scope                = module.postgreSQL.server_id
}


#-------------------------------
# Azure Redis Cache
#-------------------------------
module "redis_cache" {
  source = "../../../modules/providers/azure/redis-cache"

  name                = local.redis_cache_name
  resource_group_name = azurerm_resource_group.main.name
  capacity            = var.redis_capacity

  memory_features     = var.redis_config_memory
  premium_tier_config = var.redis_config_schedule

  resource_tags = var.resource_tags
}

// Add Contributor Role Access
resource "azurerm_role_assignment" "redis_cache" {
  count = length(local.rbac_principals)

  role_definition_name = local.role
  principal_id         = local.rbac_principals[count.index]
  scope                = module.redis_cache.id
}

module "redis_queue" {
  source = "../../../modules/providers/azure/redis-cache"

  name                = local.redis_queue_name
  resource_group_name = azurerm_resource_group.main.name
  capacity            = var.redis_capacity
  sku_name            = var.redis_queue_sku_name
  zones               = var.redis_queue_zones

  memory_features     = var.redis_config_memory
  premium_tier_config = var.redis_config_schedule

  resource_tags = var.resource_tags
}

// Add Contributor Role Access
resource "azurerm_role_assignment" "redis_queue" {
  count = length(local.rbac_principals)

  role_definition_name = local.role
  principal_id         = local.rbac_principals[count.index]
  scope                = module.redis_queue.id
}

#-------------------------------
# CosmosDB
#-------------------------------
module "cosmosdb_account" {
  source = "../../../modules/providers/azure/cosmosdb"

  name                     = local.cosmosdb_name
  resource_group_name      = azurerm_resource_group.main.name
  primary_replica_location = var.cosmosdb_replica_location
  automatic_failover       = var.cosmosdb_automatic_failover
  consistency_level        = var.cosmosdb_consistency_level
  databases                = var.cosmos_databases
  sql_collections          = var.cosmos_sql_collections

  resource_tags = var.resource_tags
}

// Add Access Control to Principal
resource "azurerm_role_assignment" "cosmos_access" {
  count = length(local.rbac_principals)

  role_definition_name = "Contributor"
  principal_id         = local.rbac_principals[count.index]
  scope                = module.cosmosdb_account.account_id
}

#-------------------------------
# Locks
#-------------------------------
resource "azurerm_management_lock" "sa_lock" {
  count = var.feature_flag.sa_lock ? 1 : 0

  name       = "osdu_file_share_lock"
  scope      = module.storage_account.id
  lock_level = "CanNotDelete"
}

resource "azurerm_management_lock" "system_sa_lock" {
  name       = "osdu_system_sa_lock"
  scope      = module.system_storage_account.id
  lock_level = "CanNotDelete"
}
