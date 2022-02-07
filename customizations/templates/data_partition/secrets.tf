/*
.Synopsis
   Terraform Secrets Control
.DESCRIPTION
   This file holds KV Secrets.
*/


#-------------------------------
# Private Variables
#-------------------------------
locals {
  partition_id = format("%s-id", var.data_partition_name)

  storage_account_name = format("%s-storage", var.data_partition_name)
  storage_key_name     = format("%s-key", local.storage_account_name)

  sdms_storage_account_name = format("%s-sdms-storage", var.data_partition_name)
  sdms_storage_key_name     = format("%s-key", local.sdms_storage_account_name)

  ingest_storage_account_name = format("%s-ingest-storage", var.data_partition_name)
  ingest_storage_key_name     = format("%s-key", local.ingest_storage_account_name)

  cosmos_connection  = format("%s-cosmos-connection", var.data_partition_name)
  cosmos_endpoint    = format("%s-cosmos-endpoint", var.data_partition_name)
  cosmos_primary_key = format("%s-cosmos-primary-key", var.data_partition_name)

  sb_namespace_name = format("%s-sb-namespace", var.data_partition_name)
  sb_connection     = format("%s-sb-connection", var.data_partition_name)

  eventgrid_domain_name                        = format("%s-eventgrid", var.data_partition_name)
  eventgrid_domain_key_name                    = format("%s-key", local.eventgrid_domain_name)
  eventgrid_recordschangedtopic_key_name       = format("%s-eventgrid-recordstopic-accesskey", var.data_partition_name)
  eventgrid_records_topic_name                 = format("%s-recordstopic", local.eventgrid_domain_name)
  eventgrid_records_topic_endpoint             = format("https://%s.%s-1.eventgrid.azure.net/api/events", local.eventgrid_records_topic, var.resource_group_location)
  eventgrid_legaltagschangedtopic_key_name     = format("%s-eventgrid-legaltagschangedtopic-accesskey", var.data_partition_name)
  eventgrid_legaltags_topic_name               = format("%s-legaltagschangedtopic", local.eventgrid_domain_name)
  eventgrid_legaltags_topic_endpoint           = format("https://%s.%s-1.eventgrid.azure.net/api/events", local.eventgrid_legaltags_topic, var.resource_group_location)
  eventgrid_schema_notification_topic_key_name = format("%s-eventgrid-schemachangedtopic-accesskey", var.data_partition_name)
  eventgrid_schema_notification_topic_name     = format("%s-schemachangedtopic", local.eventgrid_domain_name)
  eventgrid_schema_notification_topic_endpoint = format("https://%s.%s-1.eventgrid.azure.net/api/events", local.eventgrid_schema_notification_topic, var.resource_group_location)
  encryption_key_identifier_name               = format("%s-encryption-key-identifier", var.data_partition_name)
  event_grid_resourcegroup_name                = format("%s-eventgrid-resourcegroup", var.data_partition_name)
  eventgrid_gsm_topic_key_name                 = format("%s-eventgrid-statuschangedtopic-accesskey", var.data_partition_name)
  eventgrid_gsm_topic_name                     = format("%s-statuschangedtopic", local.eventgrid_domain_name)
  eventgrid_gsm_topic_endpoint                 = format("https://%s.%s-1.eventgrid.azure.net/api/events", local.eventgrid_gsm_topic, var.resource_group_location)



  elastic_endpoint = format("%s-elastic-endpoint", var.data_partition_name)
  elastic_username = format("%s-elastic-username", var.data_partition_name)
  elastic_password = format("%s-elastic-password", var.data_partition_name)
}


#-------------------------------
# Partition
#-------------------------------
resource "azurerm_key_vault_secret" "partition_id" {
  name         = local.partition_id
  value        = var.data_partition_name
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}



#-------------------------------
# Storage
#-------------------------------
resource "azurerm_key_vault_secret" "storage_name" {
  name         = local.storage_account_name
  value        = module.storage_account.name
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "storage_key" {
  name         = local.storage_key_name
  value        = module.storage_account.primary_access_key
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "sdms_storage_name" {
  name         = local.sdms_storage_account_name
  value        = module.sdms_storage_account.name
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "sdms_storage_key" {
  name         = local.sdms_storage_key_name
  value        = module.sdms_storage_account.primary_access_key
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "ingest_storage_name" {
  name         = local.ingest_storage_account_name
  value        = module.ingest_storage_account.name
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "ingest_storage_key" {
  name         = local.ingest_storage_key_name
  value        = module.ingest_storage_account.primary_access_key
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}



#-------------------------------
# CosmosDB
#-------------------------------
resource "azurerm_key_vault_secret" "cosmos_connection" {
  name         = local.cosmos_connection
  value        = module.cosmosdb_account.properties.cosmosdb.connection_strings[0]
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "cosmos_endpoint" {
  name         = local.cosmos_endpoint
  value        = module.cosmosdb_account.properties.cosmosdb.endpoint
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "cosmos_key" {
  name         = local.cosmos_primary_key
  value        = module.cosmosdb_account.properties.cosmosdb.primary_master_key
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}



#-------------------------------
# Azure Service Bus
#-------------------------------
resource "azurerm_key_vault_secret" "sb_namespace" {
  name         = local.sb_namespace_name
  value        = module.service_bus.name
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "sb_connection" {
  name         = local.sb_connection
  value        = module.service_bus.default_connection_string
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}



#-------------------------------
# Azure Event Grid
#-------------------------------
resource "azurerm_key_vault_secret" "eventgrid_name" {
  name         = local.eventgrid_domain_name
  value        = module.event_grid.name
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "eventgrid_key" {
  name         = local.eventgrid_domain_key_name
  value        = module.event_grid.primary_access_key
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "recordstopic_name" {
  name         = local.eventgrid_records_topic_name
  value        = local.eventgrid_records_topic_endpoint
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "legaltagschangedtopic_name" {
  name         = local.eventgrid_legaltags_topic_name
  value        = local.eventgrid_legaltags_topic_endpoint
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "eventgrid_resource_group" {
  name         = local.event_grid_resourcegroup_name
  value        = azurerm_resource_group.main.name
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "encryption_key_identifier_secret" {
  name         = local.encryption_key_identifier_name
  value        = azurerm_key_vault_key.encryption_key.id
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "eventgrid_topic_key" {
  name         = local.eventgrid_recordschangedtopic_key_name
  value        = lookup(module.event_grid.topic_accesskey_map, local.eventgrid_records_topic)
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "eventgrid_schema_topic_key" {
  name         = local.eventgrid_schema_notification_topic_key_name
  value        = lookup(module.event_grid.topic_accesskey_map, local.eventgrid_schema_notification_topic)
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "schemanotificationtopic_name" {
  name         = local.eventgrid_schema_notification_topic_name
  value        = local.eventgrid_schema_notification_topic_endpoint
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}


resource "azurerm_key_vault_secret" "eventgrid_legaltagschangedtopic_key" {
  name         = local.eventgrid_legaltagschangedtopic_key_name
  value        = lookup(module.event_grid.topic_accesskey_map, local.eventgrid_legaltags_topic)
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "eventgrid_gsm_topic_key" {
  name         = local.eventgrid_gsm_topic_key_name
  value        = lookup(module.event_grid.topic_accesskey_map, local.eventgrid_gsm_topic)
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "gsmtopic_name" {
  name         = local.eventgrid_gsm_topic_name
  value        = local.eventgrid_gsm_topic_endpoint
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

#-------------------------------
# Elastic
#-------------------------------
resource "azurerm_key_vault_secret" "elastic_endpoint" {
  name         = local.elastic_endpoint
  value        = var.elasticsearch_endpoint
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "elastic_username" {
  name         = local.elastic_username
  value        = var.elasticsearch_username
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "elastic_password" {
  name         = local.elastic_password
  value        = var.elasticsearch_password == null ? data.terraform_remote_state.service_resources.outputs.elastic_search_password.result.elastic : var.elasticsearch_password
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}
