locals {
  tags = merge(var.tags, { ModuleName = "terraform-azure-kubernetes-cluster-nodepool" }, { ModuleVersion = "2.3.0" })
}
