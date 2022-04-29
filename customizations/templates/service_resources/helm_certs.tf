/*
.Synopsis
   Terraform Helm Install
.DESCRIPTION
   This file holds the helm install for certificate manager.
*/

#-------------------------------
# Certificate Manager
#-------------------------------
locals {
  helm_certs_name    = "jetstack"
  helm_certs_ns      = "cert-manager"
  helm_certs_repo    = "https://charts.jetstack.io"
  helm_certs_version = "v1.1.0"
}

resource "kubernetes_namespace" "certs" {
  metadata {
    name = local.helm_certs_ns
    labels = {
      "cert-manager.io/disable-validation" = "true"
    }
  }

  depends_on = [module.aks]
}

resource "helm_release" "certmgr" {
  name       = local.helm_certs_name
  repository = local.helm_certs_repo
  chart      = "cert-manager"
  version    = local.helm_certs_version
  namespace  = local.helm_certs_ns


  set {
    name  = "installCRDs"
    value = true
  }

  depends_on = [kubernetes_namespace.certs, azurerm_role_assignment.osdu_identity_mi_operator]
}
