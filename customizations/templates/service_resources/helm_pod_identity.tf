/*
.Synopsis
   Terraform Helm Install
.DESCRIPTION
   This file holds the helm install for aad_pod_identity.
*/


#-------------------------------
# Pod Identity
#-------------------------------
locals {
  pod_identity_name         = "${local.aks_cluster_name}-pod-identity"
  helm_pod_identity_name    = "aad-pod-identity"
  helm_pod_identity_ns      = "podidentity"
  helm_pod_identity_repo    = "https://raw.githubusercontent.com/Azure/aad-pod-identity/master/charts"
  helm_pod_identity_version = "4.1.7"
}

resource "kubernetes_namespace" "pod_identity" {
  metadata {
    name = local.helm_pod_identity_ns
  }

  depends_on = [module.aks]
}

resource "helm_release" "aad_pod_id" {
  name       = local.helm_pod_identity_name
  repository = local.helm_pod_identity_repo
  chart      = "aad-pod-identity"
  version    = local.helm_pod_identity_version
  namespace  = kubernetes_namespace.pod_identity.metadata.0.name

  set {
    name  = "azureIdentities.podidentity.enabled"
    value = true
  }

  set {
    name  = "azureIdentities.podidentity.namespace"
    value = kubernetes_namespace.pod_identity.metadata.0.name
  }

  set {
    name  = "azureIdentities.podidentity.type"
    value = 0
  }

  set {
    name  = "azureIdentities.podidentity.resourceID"
    value = data.terraform_remote_state.central_resources.outputs.osdu_identity_id
  }

  set {
    name  = "azureIdentities.podidentity.clientID"
    value = data.terraform_remote_state.central_resources.outputs.osdu_identity_principal_id
  }

  set {
    name  = "azureIdentities.podidentity.binding.selector"
    value = "podidentity"
  }

  set {
    name  = "azureIdentities.podidentity.binding.name"
    value = "podidentitybinding"
  }

  depends_on = [kubernetes_namespace.pod_identity, azurerm_role_assignment.osdu_identity_mi_operator]
}
