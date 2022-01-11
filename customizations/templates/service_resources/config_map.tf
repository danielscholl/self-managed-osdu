/*
.Synopsis
   Terraform ConfigMap Control
.DESCRIPTION
   This file holds config map settings.
*/


#-------------------------------
# Kubernetes Config Map
#-------------------------------
locals {
  osdu_ns = "osdu"
}

resource "kubernetes_namespace" "osdu" {
  count = var.feature_flag.osdu_namespace ? 1 : 0

  metadata {
    name = local.osdu_ns
    labels = {
      "istio-injection" = "enabled"
    }
  }

  depends_on = [module.aks]
}


resource "kubernetes_config_map" "osduconfigmap" {
  count = var.feature_flag.osdu_namespace ? 1 : 0

  metadata {
    name      = "osdu-svc-properties"
    namespace = local.osdu_ns
  }

  data = {
    ENV_TENANT_ID         = data.azurerm_client_config.current.tenant_id
    ENV_SUBSCRIPTION_NAME = data.azurerm_subscription.current.display_name
    ENV_REGISTRY          = data.terraform_remote_state.central_resources.outputs.container_registry_name
    ENV_KEYVAULT          = format("https://%s.vault.azure.net/", data.terraform_remote_state.central_resources.outputs.keyvault_name)
    ENV_LOG_WORKSPACE_ID  = data.terraform_remote_state.central_resources.outputs.log_analytics_id
    ENV_POSTGRES_USERNAME = var.postgres_username
    ENV_POSTGRES_HOSTNAME = module.postgreSQL.server_fqdn
  }

  depends_on = [kubernetes_namespace.osdu]
}
