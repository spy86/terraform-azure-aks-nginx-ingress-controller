<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_public_ip.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [helm_release.nginx_ingress](https://registry.terraform.io/providers/hashicorp/helm/2.5.1/docs/resources/release) | resource |
| [azurerm_public_ip.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/public_ip) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_public_ip_allocation_method"></a> [az\_public\_ip\_allocation\_method](#input\_az\_public\_ip\_allocation\_method) | Defines the allocation method for this IP address. Possible values are Static or Dynamic. | `string` | `"Static"` | no |
| <a name="input_az_public_ip_sku"></a> [az\_public\_ip\_sku](#input\_az\_public\_ip\_sku) | The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. | `string` | `"Standard"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A mapping of tags to assign to the resource. | `map` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Var used for backend container name key | `string` | `"dev"` | no |
| <a name="input_nginx_helm_chart"></a> [nginx\_helm\_chart](#input\_nginx\_helm\_chart) | Chart name to be installed. The chart name can be local path, a URL to a chart, or the name of the chart if repository is specified. It is also possible to use the <repository>/<chart> format here if you are running Terraform on a system that the repository has been added to with helm repo add but this is not recommended. | `string` | `"ingress-nginx"` | no |
| <a name="input_nginx_helm_create_namespace"></a> [nginx\_helm\_create\_namespace](#input\_nginx\_helm\_create\_namespace) | Create the namespace if it does not yet exist. Defaults to false. | `bool` | `true` | no |
| <a name="input_nginx_helm_name"></a> [nginx\_helm\_name](#input\_nginx\_helm\_name) | Release name. | `string` | `"ingress-nginx"` | no |
| <a name="input_nginx_helm_namespace"></a> [nginx\_helm\_namespace](#input\_nginx\_helm\_namespace) | The namespace to install the release into. Defaults to default. | `string` | `"ingress-nginx"` | no |
| <a name="input_nginx_helm_repository"></a> [nginx\_helm\_repository](#input\_nginx\_helm\_repository) | Repository URL where to locate the requested chart. | `string` | `"https://kubernetes.github.io/ingress-nginx"` | no |
| <a name="input_nginx_helm_version"></a> [nginx\_helm\_version](#input\_nginx\_helm\_version) | Specify the exact chart version to install. If this is not specified, the latest version is installed. | `string` | `"4.0.6"` | no |
| <a name="input_nginx_ingress_controller_node_selector"></a> [nginx\_ingress\_controller\_node\_selector](#input\_nginx\_ingress\_controller\_node\_selector) | The node selector for pod assignment for the Ingress Controller pods. | `string` | `"linux"` | no |
| <a name="input_nginx_ingress_controller_replica_count"></a> [nginx\_ingress\_controller\_replica\_count](#input\_nginx\_ingress\_controller\_replica\_count) | The number of replicas of the Ingress Controller deployment. | `number` | `2` | no |
| <a name="input_nginx_ingress_controller_service_annotations"></a> [nginx\_ingress\_controller\_service\_annotations](#input\_nginx\_ingress\_controller\_service\_annotations) | Azure dns label name for public IP address | `string` | `"defaultbackend001"` | no |
| <a name="input_nginx_ingress_defaultBackend_node_selector"></a> [nginx\_ingress\_defaultBackend\_node\_selector](#input\_nginx\_ingress\_defaultBackend\_node\_selector) | The node selector for backend | `string` | `"linux"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region in which resources are deployed | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the virtual network. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->