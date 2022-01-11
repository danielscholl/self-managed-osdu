/*
.Synopsis
   Terraform Helm Install
.DESCRIPTION
   This file holds the helm install for AGIC.
*/


#-------------------------------
# Application Gateway Ingress Controller
#-------------------------------
locals {
  helm_agic_name    = "agic"
  helm_agic_ns      = "agic"
  helm_agic_repo    = "https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/"
  helm_agic_version = "1.4.0"
}


resource "kubernetes_namespace" "agic" {
  metadata {
    name = local.helm_agic_ns
  }

  depends_on = [module.aks]
}

resource "helm_release" "agic" {
  name       = local.helm_agic_name
  repository = local.helm_agic_repo
  chart      = "ingress-azure"
  version    = local.helm_agic_version
  namespace  = kubernetes_namespace.agic.metadata.0.name

  set {
    name  = "appgw.subscriptionId"
    value = data.azurerm_client_config.current.subscription_id
  }

  set {
    name  = "appgw.resourceGroup"
    value = azurerm_resource_group.main.name
  }

  set {
    name  = "appgw.applicationGatewayID"
    value = module.appgateway.id
  }

  set {
    name  = "appgw.name"
    value = module.appgateway.name
  }

  set {
    name  = "armAuth.identityResourceID"
    value = azurerm_user_assigned_identity.agicidentity.id
  }

  set {
    name  = "armAuth.identityClientID"
    value = azurerm_user_assigned_identity.agicidentity.client_id
  }

  set {
    name  = "armAuth.type"
    value = "aadPodIdentity"
  }

  set {
    name  = "appgw.shared"
    value = false
  }

  set {
    name  = "appgw.usePrivateIP"
    value = false
  }

  set {
    name  = "rbac.enabled"
    value = true
  }

  set {
    name  = "verbosityLevel"
    value = 5
  }

  depends_on = [kubernetes_namespace.agic, azurerm_role_assignment.mi_ag_operator]
}
