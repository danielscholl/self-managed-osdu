variable "helm_name" {
  description = "name of helm installation (defaults to elasticsearch-<name>"
  type        = string
  default     = null
}

variable "create_namespace" {
  description = "Create the namespace for the instance if it doesn't yet exist"
  type        = bool
  default     = true
}

variable "namespace" {
  description = "Kubernetes namespace in which to create instance"
  type        = string
  default     = "default"
}

variable "agent_pool" {
  description = "AgentPool of the cluster"
  type        = string
}

variable "node_count" {
  description = "Number of nodes"
  type        = string
  default     = 3
}

variable "storage" {
  description = "Storage per node (GB)"
  type        = string
  default     = 128
}

variable "cpu" {
  description = "Limit CPU Resources"
  type        = string
  default     = 2
}

variable "memory" {
  description = "Limit Memory Resources"
  type        = string
  default     = 8
}

variable "domain_name" {
  description = "Fully Qualified Domain Name"
  type        = string
  default     = ""
}

variable "ingress" {
  description = "Enable Ingress"
  type        = bool
  default     = false
}

variable "cluster_issuer" {
  description = "Lets Encrypt Cluster Issuer"
  type        = string
  default     = "staging"
}