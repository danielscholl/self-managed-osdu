/*
.Synopsis
   Terraform Secrets Control
.DESCRIPTION
   This file holds Key Vault Secrets.
*/

#-------------------------------
# Misc
#-------------------------------
resource "azurerm_key_vault_secret" "base_name_sr" {
  name         = "base-name-sr"
  value        = local.base_name_60
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}


#-------------------------------
# Storage
#-------------------------------
locals {
  storage_account_name        = "airflow-storage"
  storage_key_name            = "${local.storage_account_name}-key"
  storage_connection_name     = "${local.storage_account_name}-connection"
  system_storage_account_name = format("%s-storage", local.partition_id)
  system_storage_key_name     = format("%s-key", local.system_storage_account_name)
}

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

resource "azurerm_key_vault_secret" "storage_connection" {
  name         = local.storage_connection_name
  value        = format("DefaultEndpointsProtocol=https;AccountName=%s;AccountKey=%s;EndpointSuffix=core.windows.net", module.storage_account.name, module.storage_account.primary_access_key)
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "system_storage_name" {
  name         = local.system_storage_account_name
  value        = module.system_storage_account.name
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "system_storage_key" {
  name         = local.system_storage_key_name
  value        = module.system_storage_account.primary_access_key
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}


#-------------------------------
# Network
#-------------------------------
locals {
  ssl_cert_name       = "appgw-ssl-cert"
  istio_ssl_cert_name = "istio-appgw-ssl-cert"
}

resource "azurerm_key_vault_certificate" "default" {
  count = var.ssl_certificate_file == "" ? 1 : 0

  name         = local.ssl_cert_name
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = true
      key_size   = 2048
      key_type   = "RSA"
      reuse_key  = true
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }

      trigger {
        days_before_expiry = 30
      }
    }

    secret_properties {
      content_type = "application/x-pkcs12"
    }

    x509_certificate_properties {
      # Server Authentication = 1.3.6.1.5.5.7.3.1
      # Client Authentication = 1.3.6.1.5.5.7.3.2
      extended_key_usage = ["1.3.6.1.5.5.7.3.1"]

      key_usage = [
        "cRLSign",
        "dataEncipherment",
        "digitalSignature",
        "keyAgreement",
        "keyCertSign",
        "keyEncipherment",
      ]

      subject_alternative_names {
        dns_names = [var.dns_name, "${local.base_name}-gw.${azurerm_resource_group.main.location}.cloudapp.azure.com"]
      }

      subject            = "CN=*.contoso.com"
      validity_in_months = 12
    }
  }

  lifecycle {
    ignore_changes = all
  }
}

resource "azurerm_key_vault_certificate" "istio_ssl_certificate" {
  count = var.ssl_certificate_file == "" ? 1 : 0

  name         = local.istio_ssl_cert_name
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = true
      key_size   = 2048
      key_type   = "RSA"
      reuse_key  = true
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }

      trigger {
        days_before_expiry = 30
      }
    }

    secret_properties {
      content_type = "application/x-pkcs12"
    }

    x509_certificate_properties {
      # Server Authentication = 1.3.6.1.5.5.7.3.1
      # Client Authentication = 1.3.6.1.5.5.7.3.2
      extended_key_usage = ["1.3.6.1.5.5.7.3.1"]

      key_usage = [
        "cRLSign",
        "dataEncipherment",
        "digitalSignature",
        "keyAgreement",
        "keyCertSign",
        "keyEncipherment",
      ]

      subject_alternative_names {
        dns_names = [var.dns_name, "${local.base_name}-istio-gw.${azurerm_resource_group.main.location}.cloudapp.azure.com"]
      }

      subject            = "CN=*.contoso.com"
      validity_in_months = 12
    }
  }

  lifecycle {
    ignore_changes = all
  }
}

#-------------------------------
# PostgreSQL
#-------------------------------
locals {
  postgres_name_name     = "postgres-name"
  postgres_username_name = "postgres-username"
  postgres_password_name = "postgres-password"
  postgres_password      = coalesce(var.postgres_password, random_password.postgres[0].result)
}

resource "azurerm_key_vault_secret" "postgres_name" {
  name         = local.postgres_name_name
  value        = module.postgreSQL.server_name
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "postgres_username" {
  name         = local.postgres_username_name
  value        = var.postgres_username
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "postgres_password" {
  name         = local.postgres_password_name
  value        = local.postgres_password
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

#-------------------------------
# Azure Redis Cache
#-------------------------------
locals {
  redis_hostname            = "redis-hostname"
  redis_password_name       = "redis-password"
  redis_queue_hostname      = "redis-queue-hostname"
  redis_queue_password_name = "redis-queue-password"

}

resource "azurerm_key_vault_secret" "redis_host" {
  name         = local.redis_hostname
  value        = module.redis_cache.hostname
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "redis_password" {
  name         = local.redis_password_name
  value        = module.redis_cache.primary_access_key
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "redis_queue_host" {
  name         = local.redis_queue_hostname
  value        = module.redis_queue.hostname
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

resource "azurerm_key_vault_secret" "redis_queue_password" {
  name         = local.redis_queue_password_name
  value        = module.redis_queue.primary_access_key
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}

#-------------------
# Cosmos DB
#-------------------
locals {
  partition_id = "system"

  cosmos_connection  = format("%s-cosmos-connection", local.partition_id)
  cosmos_endpoint    = format("%s-cosmos-endpoint", local.partition_id)
  cosmos_primary_key = format("%s-cosmos-primary-key", local.partition_id)
}

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
# Istio
#-------------------------------
resource "azurerm_key_vault_secret" "istio_int_load_balancer_ip" {
  count        = var.feature_flag.autoscaling ? 1 : 0
  name         = "istio-int-load-balancer-ip"
  value        = var.istio_int_load_balancer_ip == "" ? null : var.istio_int_load_balancer_ip
  key_vault_id = data.terraform_remote_state.central_resources.outputs.keyvault_id
}
