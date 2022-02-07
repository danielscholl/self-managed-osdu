
terraform {
  required_version = ">= 0.14.10"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.7.1"
    }
  }
}