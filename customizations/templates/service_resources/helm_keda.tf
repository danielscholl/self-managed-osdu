/*
.Synopsis
   Terraform Helm Install
.DESCRIPTION
   This file holds the helm install for KEDA.
*/


#-------------------------------
# Keda
#-------------------------------
locals {
  helm_keda_name    = "keda"
  helm_keda_ns      = "keda"
  helm_keda_repo    = "https://kedacore.github.io/charts"
  helm_keda_version = var.keda_v2_enabled == true ? "2.2.0" : "1.5.0"
}

resource "kubernetes_namespace" "keda" {
  metadata {
    name = local.helm_keda_ns
  }

  depends_on = [module.aks]
}

resource "helm_release" "keda" {
  name       = local.helm_keda_name
  repository = local.helm_keda_repo
  chart      = "keda"
  version    = local.helm_keda_version
  namespace  = local.helm_keda_ns

  depends_on = [kubernetes_namespace.keda, azurerm_role_assignment.osdu_identity_mi_operator]
}
