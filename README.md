# Azure Kubernetes Service (AKS) Cluster

## Introduction

This module deploys an Azure Kubernetes Service (AKS) nodepool.

## Security Controls

This module is not sufficient on its own to meet the necessary security controls required
by the Government of Canada. It provides a framework for implementing the controls that
are determined by your organization's Security Assessment & Authorization (SA&A) process.

## Dependencies

* An existing Azure Kubernetes Service (AKS) cluster

### Networking

Nodes in the cluster must be attached to an existing subnet within an Azure Virtual Network.
The subnet **must** have a Network Virtual Appliance at the default route (ie. `0.0.0.0/0`). See the [Azure documentation on egress](https://docs.microsoft.com/en-us/azure/aks/egress-outboundtype#outbound-type-of-userdefinedrouting) for more information. This can be an Azure Firewall or a virtual appliance performing firewall/routing functions.

Ensure your virtual network IP space does not overlap with the subnets defined in the [Azure CNI prerequisites](https://docs.microsoft.com/en-us/azure/aks/configure-azure-cni#prerequisites).

## Optional (depending on options configured):

* None

## Usage

```terraform
module "cluster" {
  source = "git::https://github.com/canada-ca-terraform-modules/terraform-azurerm-kubernetes-cluster-nodepool.git?ref=$REF"

  # ... your variable values
}
```

## Variables Values

| Name                   | Type         | Required | Value                                                                                |
| ---------------------- | ------------ | -------- | ------------------------------------------------------------------------------------ |
| name                   | string       | yes      | Name of the node pool created by the module                                          |
| kubernetes_cluster_id  | string       | yes      | Azure Resource ID for the Azure Kubernetes Cluster (AKS) to add the nodepool to      |
| node_count             | number       | no       | Number of nodes in the node pool                                                     |
| kubernetes_version     | string       | no       | Kubernetes version of the node pool (if unset, uses the same version as the cluster) |
| availability_zones     | list(string) | no       | List of availability zones for the node pool                                         |
| vm_size                | string       | no       | VM size of the node pool                                                             |
| labels                 | map(string)  | no       | List of labels to assign to nodes in the node pool                                   |
| enable_host_encryption | bool         | no       | Enable host encryption in the node pool                                              |
| disk_size_gb           | number       | no       | Size of the node disk size of the node pool                                          |
| disk_type              | string       | no       | Type of disk used by the node pool (Managed, Ephemeral)                              |
| os_type                | string       | no       | OS type for the node pool (Linux or Windows)                                         |
| subnet_id              | string       | yes      | Subnet where to attach nodes in the node pool                                        |
| upgrade_max_surge      | string       | no       | Maximum node surge during a node pool upgrade                                        |
| enable_auto_scaling    | bool         | no       | Enable node pool auto scaling                                                        |
| auto_scaling_min_nodes | number       | no       | Minimum number of nodes when auto scaling is enabled                                 |
| auto_scaling_max_nodes | number       | no       | Maximum number of nodes when auto scaling is enabled                                 |

## History

| Date       | Release | Change                                        |
| ---------- | ------- | --------------------------------------------- |
| 2023-09-11 | 1.0.3   | Backport tagging strategy for Azure resources |
| 2023-07-21 | 1.0.2   | Leverage AKS managed blob-csi driver          |
| 2023-03-17 | 1.0.1   | Add vm_priority variable                      |
| 2021-07-06 | 1.0.0   | Initial release                               |
