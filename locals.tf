locals {
  tags = merge(var.tags, { ModuleName = "terraform-azure-kubernetes-cluster-nodepool" }, { ModuleVersion = "1.0.3" })
}
