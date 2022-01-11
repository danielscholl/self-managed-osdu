/*
.Synopsis
   Terraform Main Control
.DESCRIPTION
   This file holds the main control.
*/


terraform {
  required_version = ">= 0.14"

  backend "azurerm" {
    key = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.90.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "=2.13.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "=3.1.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "=3.1.0"
    }
  }
}

#-------------------------------
# Providers
#-------------------------------
provider "azurerm" {
  features {}
}


#-------------------------------
# Private Variables
#-------------------------------
locals {
  // sanitize names
  prefix    = replace(trimspace(lower(var.prefix)), "_", "-")
  workspace = replace(trimspace(lower(terraform.workspace)), "-", "")
  suffix    = var.randomization_level > 0 ? "-${random_string.workspace_scope.result}" : ""
  partition = split("-", trimspace(lower(terraform.workspace)))[0]

  // base prefix for resources, prefix constraints documented here: https://docs.microsoft.com/en-us/azure/architecture/best-practices/naming-conventions
  base_name    = length(local.prefix) > 0 ? "${local.prefix}-${local.workspace}${local.suffix}" : "${local.workspace}${local.suffix}"
  base_name_21 = length(local.base_name) < 22 ? local.base_name : "${substr(local.base_name, 0, 21 - length(local.suffix))}${local.suffix}"
  base_name_46 = length(local.base_name) < 47 ? local.base_name : "${substr(local.base_name, 0, 46 - length(local.suffix))}${local.suffix}"
  base_name_60 = length(local.base_name) < 61 ? local.base_name : "${substr(local.base_name, 0, 60 - length(local.suffix))}${local.suffix}"
  base_name_76 = length(local.base_name) < 77 ? local.base_name : "${substr(local.base_name, 0, 76 - length(local.suffix))}${local.suffix}"
  base_name_83 = length(local.base_name) < 84 ? local.base_name : "${substr(local.base_name, 0, 83 - length(local.suffix))}${local.suffix}"

  resource_group_name = format("%s-%s-%s-rg", var.prefix, local.workspace, random_string.workspace_scope.result)
  retention_policy    = var.log_retention_days == 0 ? false : true

  storage_name        = "${replace(local.base_name_21, "-", "")}data"
  sdms_storage_name   = "${replace(local.base_name_21, "-", "")}sdms"
  ingest_storage_name = "${replace(local.base_name_21, "-", "")}ingest"
  cosmosdb_name       = "${local.base_name}-db"
  sb_namespace        = "${local.base_name_21}-bus"

  eg_sbtopic_subscriber               = "servicebusrecordstopic"
  eg_sbtopic_schema_subscriber        = "servicebusschemachangedtopic"
  eg_sbtopic_gsm_subscriber           = "servicebusstatuschangedtopic"
  eg_sbtopic_legaltags_subscriber     = "servicebuslegaltagschangedtopic"
  eventgrid_name                      = "${local.base_name_21}-grid"
  eventgrid_records_topic             = format("%s-recordstopic", local.eventgrid_name)
  eventgrid_schema_notification_topic = format("%s-schemachangedtopic", local.eventgrid_name)
  eventgrid_legaltags_topic           = format("%s-legaltagschangedtopic", local.eventgrid_name)
  eventgrid_gsm_topic                 = format("%s-statuschangedtopic", local.eventgrid_name)

  rbac_principals = [
    data.terraform_remote_state.central_resources.outputs.osdu_identity_principal_id,
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

data "terraform_remote_state" "service_resources" {
  backend = "azurerm"

  config = {
    storage_account_name = var.remote_state_account
    container_name       = var.remote_state_container
    key                  = format("terraform.tfstateenv:%s", var.service_resources_workspace_name)
  }
}

resource "random_string" "workspace_scope" {
  keepers = {
    # Generate a new id each time we switch to a new workspace or app id
    ws_name = replace(trimspace(lower(terraform.workspace)), "-", "")
    prefix  = replace(trimspace(lower(var.prefix)), "_", "-")
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
  lifecycle { ignore_changes = [tags] }
}


#-------------------------------
# Storage
#-------------------------------
module "storage_account" {
  source = "../../../modules/providers/azure/storage-account"

  name                = local.storage_name
  resource_group_name = azurerm_resource_group.main.name
  container_names     = var.storage_containers
  kind                = "StorageV2"
  replication_type    = var.storage_replication_type

  resource_tags  = var.resource_tags
  blob_cors_rule = var.blob_cors_rule
}

// Add Access Control to Principal
resource "azurerm_role_assignment" "storage_access" {
  count = length(local.rbac_principals)

  role_definition_name = "Contributor"
  principal_id         = local.rbac_principals[count.index]
  scope                = module.storage_account.id
}

// Add Data Contributor Role to Principal
resource "azurerm_role_assignment" "storage_data_contributor" {
  count      = length(local.rbac_principals)
  depends_on = [azurerm_role_assignment.storage_access]

  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = local.rbac_principals[count.index]
  scope                = module.storage_account.id
}

module "sdms_storage_account" {
  source = "../../../modules/providers/azure/storage-account"

  name                = local.sdms_storage_name
  resource_group_name = azurerm_resource_group.main.name
  container_names     = []
  kind                = "StorageV2"
  replication_type    = var.storage_replication_type

  resource_tags = merge(var.resource_tags, var.resource_tags_sdms)
}

// Add Access Control to Principal
resource "azurerm_role_assignment" "sdms_storage_access" {
  count = length(local.rbac_principals)

  role_definition_name = "Contributor"
  principal_id         = local.rbac_principals[count.index]
  scope                = module.sdms_storage_account.id
}

// Add Data Contributor Role to Principal
resource "azurerm_role_assignment" "sdms_storage_data_contributor" {
  count      = length(local.rbac_principals)
  depends_on = [azurerm_role_assignment.sdms_storage_access]

  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = local.rbac_principals[count.index]
  scope                = module.sdms_storage_account.id
}

module "ingest_storage_account" {
  source = "../../../modules/providers/azure/storage-account"

  name                = local.ingest_storage_name
  resource_group_name = azurerm_resource_group.main.name
  container_names     = []
  kind                = "StorageV2"
  replication_type    = var.storage_replication_type

  resource_tags = var.resource_tags
}

// Add Access Control to Principal
resource "azurerm_role_assignment" "ingest_storage_access" {
  count = length(local.rbac_principals)

  role_definition_name = "Contributor"
  principal_id         = local.rbac_principals[count.index]
  scope                = module.ingest_storage_account.id
}

// Add Data Contributor Role to Principal
resource "azurerm_role_assignment" "ingest_storage_data_contributor" {
  count      = length(local.rbac_principals)
  depends_on = [azurerm_role_assignment.ingest_storage_access]

  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = local.rbac_principals[count.index]
  scope                = module.ingest_storage_account.id
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
# Azure Service Bus
#-------------------------------
module "service_bus" {
  source = "../../../modules/providers/azure/service-bus"

  name                = local.sb_namespace
  resource_group_name = azurerm_resource_group.main.name
  sku                 = var.sb_sku
  topics              = var.sb_topics

  resource_tags = var.resource_tags
}

// Add Access Control to Principal
resource "azurerm_role_assignment" "sb_access" {
  count = length(local.rbac_principals)

  role_definition_name = "Azure Service Bus Data Sender"
  principal_id         = local.rbac_principals[count.index]
  scope                = module.service_bus.id
}


#-------------------------------
# Azure Event Grid
#-------------------------------
module "event_grid" {
  source = "../../../modules/providers/azure/event-grid"

  name                = local.eventgrid_name
  resource_group_name = azurerm_resource_group.main.name

  topics = [
    {
      name = local.eventgrid_records_topic
    },
    {
      name = local.eventgrid_legaltags_topic
    },
    {
      name = local.eventgrid_schema_notification_topic
    },
    {
      name = local.eventgrid_gsm_topic
    }
  ]

  resource_tags = var.resource_tags
}

// Add EventGrid EventSubscription Contributor access to Principal
resource "azurerm_role_assignment" "event_grid_topics_role" {
  count = length(local.rbac_principals)

  role_definition_name = "EventGrid EventSubscription Contributor"
  principal_id         = local.rbac_principals[count.index]
  scope                = lookup(module.event_grid.topics, local.eventgrid_records_topic)
}

// Add EventGrid EventSubscription Contributor access to Principal For Legal Tags
resource "azurerm_role_assignment" "event_grid_topics_role_legaltags" {
  count = length(local.rbac_principals)

  role_definition_name = "EventGrid EventSubscription Contributor"
  principal_id         = local.rbac_principals[count.index]
  scope                = lookup(module.event_grid.topics, local.eventgrid_legaltags_topic)
}

// Add a Service Bus Topic subscriber that is used by WKS service.
resource "azurerm_eventgrid_event_subscription" "service_bus_topic_subscriber" {
  name = local.eg_sbtopic_subscriber

  scope      = lookup(module.event_grid.topics, local.eventgrid_records_topic)
  depends_on = [module.service_bus.id]

  service_bus_topic_endpoint_id = lookup(module.service_bus.topicsmap, "recordstopiceg")
}

// Add a Service Bus Topic subscriber that act as EventHandler for legaltagschangedtopic
resource "azurerm_eventgrid_event_subscription" "service_bus_topic_subscriber_legaltags" {
  name                          = local.eg_sbtopic_legaltags_subscriber
  scope                         = lookup(module.event_grid.topics, local.eventgrid_legaltags_topic)
  depends_on                    = [module.service_bus.id]
  service_bus_topic_endpoint_id = lookup(module.service_bus.topicsmap, "legaltagschangedtopiceg")
}

// Add EventGrid EventSubscription Contributor access to Principal For Schema
resource "azurerm_role_assignment" "event_grid_topics_role_schema" {
  count = length(local.rbac_principals)

  role_definition_name = "EventGrid EventSubscription Contributor"
  principal_id         = local.rbac_principals[count.index]
  scope                = lookup(module.event_grid.topics, local.eventgrid_schema_notification_topic)
}

// Add a Service Bus Topic subscriber that act as EventHandler for schemachangedtopic
resource "azurerm_eventgrid_event_subscription" "service_bus_topic_subscriber_schema" {
  name                          = local.eg_sbtopic_schema_subscriber
  scope                         = lookup(module.event_grid.topics, local.eventgrid_schema_notification_topic)
  depends_on                    = [module.service_bus.id]
  service_bus_topic_endpoint_id = lookup(module.service_bus.topicsmap, "schemachangedtopiceg")
}

// Add EventGrid EventSubscription Contributor access to Principal
resource "azurerm_role_assignment" "event_grid_topics_role_gsm" {
  count = length(local.rbac_principals)

  role_definition_name = "EventGrid EventSubscription Contributor"
  principal_id         = local.rbac_principals[count.index]
  scope                = lookup(module.event_grid.topics, local.eventgrid_gsm_topic)
}

// Add a Service Bus Topic subscriber that act as EventHandler for statuschangedtopic
resource "azurerm_eventgrid_event_subscription" "service_bus_topic_subscriber_gsm" {
  name = local.eg_sbtopic_gsm_subscriber

  scope      = lookup(module.event_grid.topics, local.eventgrid_gsm_topic)
  depends_on = [module.service_bus.id]

  service_bus_topic_endpoint_id = lookup(module.service_bus.topicsmap, "statuschangedtopiceg")
}

#-------------------------------
# Locks
#-------------------------------
resource "azurerm_management_lock" "sa_lock" {
  name       = "osdu_ds_sa_lock"
  scope      = module.storage_account.id
  lock_level = "CanNotDelete"
}

resource "azurerm_management_lock" "sdms_sa_lock" {
  name       = "osdu_sdms_sa_lock"
  scope      = module.sdms_storage_account.id
  lock_level = "CanNotDelete"
}

resource "azurerm_management_lock" "db_lock" {
  name       = "osdu_ds_db_lock"
  scope      = module.cosmosdb_account.properties.cosmosdb.id
  lock_level = "CanNotDelete"
}

resource "azurerm_management_lock" "ingest_sa_lock" {
  name       = "osdu_ingest_sa_lock"
  scope      = module.ingest_storage_account.id
  lock_level = "CanNotDelete"
}

# Reference (https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_management_policy)
# Prefix Value (https://stackoverflow.com/questions/65593429/set-lifecycle-management-rule-on-all-blobs-in-a-container)
resource "azurerm_storage_management_policy" "main" {
  storage_account_id = module.storage_account.id
  rule {
    name    = "auto-delete-blobs"
    enabled = var.feature_flag.storage_mgmt_policy_enabled
    filters {
      prefix_match = ["file-staging-area"]
      blob_types   = ["blockBlob"]

    }
    actions {
      base_blob {
        delete_after_days_since_modification_greater_than = var.sa_retention_days
      }
    }
  }
}
