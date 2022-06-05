data "azurerm_public_ip" "main" {
  name                = "${var.environment}-${var.cluster_name}-${var.region}-aks-pip01"
  resource_group_name = "MC_${data.azurerm_resource_group.rg.name}_${var.environment}-${var.cluster_name}-${var.region}-aks_westeurope"

depends_on = [ "azurerm_public_ip.main"] 
}

resource "helm_release" "nginx_ingress" {
    name             = "${var.nginx_helm_name}"
    repository       = "${var.nginx_helm_repository}"
    chart            = "${var.nginx_helm_chart}"
    version          = "${var.nginx_helm_version}"
    namespace        = "${var.nginx_helm_namespace}"
    create_namespace = "${var.nginx_helm_create_namespace}"

  set {
    name  = "controller.replicaCount"
    value = "${var.nginx_ingress_controller_replica_count}"
  }
  set {
    name  = "controller.nodeSelector.beta\\.kubernetes\\.io/os"
    value = "${var.nginx_ingress_controller_node_selector}"
  }
  set {
    name  = "defaultBackend.nodeSelector.beta\\.kubernetes\\.io/os"
    value = "${var.nginx_ingress_defaultBackend_node_selector}"
  }
  set {
    name  = "controller.service.loadBalancerIP"
    value = "${data.azurerm_public_ip.main.ip_address}"
  }
  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-dns-label-name"
    value = "${var.nginx_ingress_controller_service_annotations}"
  }

depends_on = [ "azurerm_public_ip.main" ] 
}