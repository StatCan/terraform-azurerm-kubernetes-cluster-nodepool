
resource "azurerm_kubernetes_cluster_node_pool" "nodepool" {
  name                  = var.name
  kubernetes_cluster_id = var.kubernetes_cluster_id

  node_count           = !var.enable_auto_scaling ? var.node_count : null
  orchestrator_version = var.kubernetes_version
  zones                = var.availability_zones

  # Node configuration
  vm_size               = var.vm_size
  node_labels           = var.labels
  node_taints           = var.taints
  enable_node_public_ip = false
  max_pods              = var.max_pods

  # Disk configuration
  enable_host_encryption = var.enable_host_encryption
  os_disk_size_gb        = var.disk_size_gb
  os_disk_type           = var.disk_type
  os_type                = var.os_type

  # Network configuration
  vnet_subnet_id = var.subnet_id

  # Upgrade configuration
  upgrade_settings {
    max_surge = var.uprade_max_surge
  }

  # Autoscaling
  enable_auto_scaling = var.enable_auto_scaling
  min_count           = var.enable_auto_scaling ? var.auto_scaling_min_nodes : null
  max_count           = var.enable_auto_scaling ? var.auto_scaling_max_nodes : null

  tags = var.tags
}
