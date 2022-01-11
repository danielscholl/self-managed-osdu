/*
.Synopsis
   Terraform Helm Install
.DESCRIPTION
   This file holds the helm install for KV Driver.
*/


#-------------------------------
# KeyVault Secret Driver
#-------------------------------
locals {
  helm_kv_csi_name    = "kvsecrets"
  helm_kv_csi_ns      = "kvsecrets"
  helm_kv_csi_repo    = "https://raw.githubusercontent.com/Azure/secrets-store-csi-driver-provider-azure/master/charts"
  helm_kv_csi_version = "1.0.0"
}

resource "kubernetes_namespace" "kvsecrets" {
  metadata {
    name = local.helm_kv_csi_ns
  }

  depends_on = [module.aks]
}

resource "helm_release" "kvsecrets" {
  name       = local.helm_kv_csi_name
  repository = local.helm_kv_csi_repo
  chart      = "csi-secrets-store-provider-azure"
  version    = local.helm_kv_csi_version
  namespace  = local.helm_kv_csi_ns

  set {
    name  = "secrets-store-csi-driver.linux.metricsAddr"
    value = ":8081"
  }

  set {
    name  = "secrets-store-csi-driver.syncSecret.enabled"
    value = "true"
  }

  set {
    name = "server\\.resources"
    # You can provide a map of value using yamlencode
    value = yamlencode({
      limits = {
        cpu    = "200m"
        memory = "50Mi"
      }
      requests = {
        cpu    = "100m"
        memory = "30Mi"
      }
    })
  }

  depends_on = [kubernetes_namespace.kvsecrets, azurerm_role_assignment.osdu_identity_mi_operator]
}
