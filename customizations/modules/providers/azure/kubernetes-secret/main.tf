
data "kubernetes_secret" "secret" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }
}
