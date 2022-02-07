/*
.Synopsis
   Terraform Helm Install
.DESCRIPTION
   This file holds the helm install for flux.
*/


#-------------------------------
# Flux
#-------------------------------
locals {
  helm_flux_name    = "flux"
  helm_flux_ns      = "flux"
  helm_flux_repo    = "https://charts.fluxcd.io"
  helm_flux_version = "1.6.0"
  helm_flux_secret  = "flux-git-deploy"
}

resource "kubernetes_namespace" "flux" {
  count = var.feature_flag.osdu_namespace ? 1 : 0

  metadata {
    name = local.helm_flux_ns
  }

  depends_on = [module.aks]
}

resource "kubernetes_secret" "flux_ssh" {
  count = var.feature_flag.osdu_namespace ? 1 : 0

  metadata {
    name      = local.helm_flux_secret
    namespace = local.helm_flux_ns
  }

  type = "Opaque"

  data = {
    identity = file(var.gitops_ssh_key_file)
  }

  depends_on = [kubernetes_namespace.flux]
}

resource "helm_release" "flux" {
  count = var.feature_flag.osdu_namespace ? 1 : 0

  name       = local.helm_flux_name
  repository = local.helm_flux_repo
  chart      = "flux"
  version    = local.helm_flux_version
  namespace  = local.helm_flux_ns

  set {
    name  = "git.url"
    value = var.gitops_ssh_url
  }

  set {
    name  = "git.branch"
    value = var.gitops_branch
  }

  set {
    name  = "git.secretName"
    value = local.helm_flux_secret
  }

  set {
    name  = "git.path"
    value = var.gitops_path
  }

  set {
    name  = "git.pollInterval"
    value = "5m"
  }

  set {
    name  = "git.label"
    value = "flux-sync"
  }

  set {
    name  = "registry.acr.enabled"
    value = "true"
  }

  set {
    name  = "syncGarbageCollection.enabled"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "flux"
  }

  depends_on = [kubernetes_namespace.flux, kubernetes_secret.flux_ssh]
}
