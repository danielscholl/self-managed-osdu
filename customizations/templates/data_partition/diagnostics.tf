/*
.Synopsis
   Terraform Diagnostics Control
.DESCRIPTION
   This file holds diagnostics settings.
*/


#-------------------------------
# CosmosDB
#-------------------------------
resource "azurerm_monitor_diagnostic_setting" "db_diagnostics" {
  name                           = "db_diagnostics"
  target_resource_id             = module.cosmosdb_account.account_id
  log_analytics_workspace_id     = data.terraform_remote_state.central_resources.outputs.log_analytics_id
  log_analytics_destination_type = "AzureDiagnostics"

  // This one always off.
  log {
    category = "CassandraRequests"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  // This one always off.
  log {
    category = "TableApiRequests"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "ControlPlaneRequests"

    retention_policy {
      days    = var.log_retention_days
      enabled = local.retention_policy
    }
  }

  log {
    category = "DataPlaneRequests"
    enabled  = true

    retention_policy {
      days    = var.log_retention_days
      enabled = local.retention_policy
    }
  }

  // This one always off.
  log {
    category = "GremlinRequests"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  // This one always off.
  log {
    category = "MongoRequests"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "PartitionKeyRUConsumption"

    retention_policy {
      days    = var.log_retention_days
      enabled = local.retention_policy
    }
  }

  log {
    category = "PartitionKeyStatistics"

    retention_policy {
      days    = var.log_retention_days
      enabled = local.retention_policy
    }
  }

  log {
    category = "QueryRuntimeStatistics"
    enabled  = true

    retention_policy {
      days    = var.log_retention_days
      enabled = local.retention_policy
    }
  }

  metric {
    category = "Requests"

    retention_policy {
      days    = var.log_retention_days
      enabled = local.retention_policy
    }
  }
}



#-------------------------------
# Azure Service Bus
#-------------------------------
resource "azurerm_monitor_diagnostic_setting" "sb_diagnostics" {
  name                       = "sb_diagnostics"
  target_resource_id         = module.service_bus.id
  log_analytics_workspace_id = data.terraform_remote_state.central_resources.outputs.log_analytics_id

  log {
    category = "OperationalLogs"

    retention_policy {
      days    = var.log_retention_days
      enabled = local.retention_policy
    }
  }

  log {
    category = "VNetAndIPFilteringLogs"

    retention_policy {
      days    = var.log_retention_days
      enabled = local.retention_policy
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      days    = var.log_retention_days
      enabled = local.retention_policy
    }
  }
}



#-------------------------------
# Azure Event Grid
#-------------------------------
resource "azurerm_monitor_diagnostic_setting" "eg_diagnostics" {
  name                       = "eg_diagnostics"
  target_resource_id         = module.event_grid.id
  log_analytics_workspace_id = data.terraform_remote_state.central_resources.outputs.log_analytics_id

  log {
    category = "DeliveryFailures"

    retention_policy {
      days    = var.log_retention_days
      enabled = local.retention_policy
    }
  }

  log {
    category = "DataPlaneRequests"

    retention_policy {
      days    = var.log_retention_days
      enabled = local.retention_policy
    }
  }

  log {
    category = "PublishFailures"

    retention_policy {
      days    = var.log_retention_days
      enabled = local.retention_policy
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      days    = var.log_retention_days
      enabled = local.retention_policy
    }
  }
}
