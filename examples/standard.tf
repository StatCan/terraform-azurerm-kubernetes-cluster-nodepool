#####################
### Prerequisites ###
#####################

provider "azurerm" {
  features {}
}

# Manages an Azure Resource Group.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
#
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "Canada Central"
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  service_principal {
    client_id     = "00000000-0000-0000-0000-000000000000"
    client_secret = "00000000000000000000000000000000"
  }
}

###################################
### Kubernetes Node Pool Module ###
###################################

# Invokes the terraform-azurerm-kubernetes-cluster-nodepool module used to create a Node Pool within a Kubernetes Cluster.
#
# https://gitlab.k8s.cloud.statcan.ca/cloudnative/platform/terraform/terraform-azure-kubernetes-cluster-nodepool
#
module "internal_node_pool" {
  source = "git::https://gitlab.k8s.cloud.statcan.ca/cloudnative/platform/terraform/terraform-azure-kubernetes-cluster-nodepool.git?ref=main"

  name                  = "internal"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.example.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1

  tags = {
    Environment = "Development"
  }
}
