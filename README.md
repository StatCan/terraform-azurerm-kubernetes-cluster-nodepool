# terraform-azurerm-kubernetes-cluster-nodepool

This repository contains an opionionated Terraform module that can be used to provision a Kubernetes Node Pool.

## Usage

Examples for this module along with various configurations can be found in the [examples/](examples/) folder.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.15, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.15, < 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster_node_pool.nodepool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_scaling_max_nodes"></a> [auto\_scaling\_max\_nodes](#input\_auto\_scaling\_max\_nodes) | n/a | `number` | `3` | no |
| <a name="input_auto_scaling_min_nodes"></a> [auto\_scaling\_min\_nodes](#input\_auto\_scaling\_min\_nodes) | n/a | `number` | `0` | no |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | n/a | `number` | `256` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | n/a | `string` | `"Managed"` | no |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | n/a | `bool` | `false` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | n/a | `bool` | `false` | no |
| <a name="input_kubernetes_cluster_id"></a> [kubernetes\_cluster\_id](#input\_kubernetes\_cluster\_id) | ID of the Kubernetes cluster | `any` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | n/a | `any` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | n/a | `map(string)` | `{}` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | n/a | `number` | `60` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the pool | `any` | n/a | yes |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | n/a | `number` | `3` | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | n/a | `string` | `"Linux"` | no |
| <a name="input_pod_subnet_id"></a> [pod\_subnet\_id](#input\_pod\_subnet\_id) | n/a | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_taints"></a> [taints](#input\_taints) | n/a | `list(string)` | `[]` | no |
| <a name="input_uprade_max_surge"></a> [uprade\_max\_surge](#input\_uprade\_max\_surge) | Per documentation, https://docs.microsoft.com/en-us/azure/aks/upgrade-cluster#customize-node-surge-upgrade For production node pools, we recommend a max-surge setting of 33%. | `string` | `"33%"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | n/a | `string` | `"Standard_D2s_v3"` | no |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | n/a | `any` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | n/a | `list(string)` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## History

| Date       | Release | Change         |
| ---------- | ------- | -------------- |
| 2022-11-22 | v1.0.0  | initial commit |
