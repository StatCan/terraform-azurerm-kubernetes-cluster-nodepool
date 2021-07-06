variable "name" {
  description = "Name of the pool"
}

variable "kubernetes_cluster_id" {
  description = "ID of the Kubernetes cluster"
}

variable "node_count" {
  type    = number
  default = 3
}

variable "kubernetes_version" {
  default = null
}

variable "availability_zones" {
  type    = list(string)
  default = null
}
variable "vm_size" {
  default = "Standard_D2s_v3"
}

variable "max_pods" {
  default = 60
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "enable_host_encryption" {
  type    = bool
  default = false
}

variable "disk_size_gb" {
  type    = number
  default = 256
}

variable "disk_type" {
  default = "Managed"
}

variable "os_type" {
  default = "Linux"
}

variable "subnet_id" {

}

# Per documentation, https://docs.microsoft.com/en-us/azure/aks/upgrade-cluster#customize-node-surge-upgrade
#   For production node pools, we recommend a max-surge setting of 33%.
variable "uprade_max_surge" {
  default = "33%"
}

variable "taints" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "enable_auto_scaling" {
  type    = bool
  default = false
}

variable "auto_scaling_min_nodes" {
  type    = number
  default = 0
}

variable "auto_scaling_max_nodes" {
  type    = number
  default = 3
}
