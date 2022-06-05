# How to use

```
provider "azurerm" {
features {}
}

provider "helm" {
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.credentials.kube_config.0.host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.cluster_ca_certificate)

  }
}

data "azurerm_kubernetes_cluster" "credentials" {
  name                = "dev-examplecakscluster-weu-aks"
  resource_group_name = "dev-k8s-test-weu-rg"

}

module "aks-ingress" {
  source  = "spy86/aks-nginx-ingress-controller/azure"
  version = "1.0.1"
  resource_group_name = "dev-k8s-test-weu-rg"
  cluster_name = "examplecakscluster"
  az_public_ip_allocation_method = "Static"
  az_public_ip_sku = "Standard"
  nginx_helm_name = "ingress-nginx"
  nginx_helm_repository = "https://kubernetes.github.io/ingress-nginx"
  nginx_helm_chart = "ingress-nginx"
  nginx_helm_version = "4.0.6"
  nginx_helm_namespace = "ingress-nginx"
  nginx_helm_create_namespace = "true"
  nginx_ingress_controller_replica_count = "2"
  nginx_ingress_controller_node_selector = "linux"
  nginx_ingress_defaultBackend_node_selector = "linux"
  nginx_ingress_controller_service_annotations = "webbackend001"

  default_tags = {
      Administrator = "Someone"
      Department = "IT"
      CostCentre = "ABC123"
      ContactPerson = "Someone@example.com"
      ManagedByTerraform = "True"
}

}
```