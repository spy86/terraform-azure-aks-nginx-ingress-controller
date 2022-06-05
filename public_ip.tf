resource "azurerm_public_ip" "main" {
  name                = "${var.environment}-${var.cluster_name}-${var.region}-aks-pip01"
  resource_group_name = "MC_${data.azurerm_resource_group.rg.name}_${var.environment}-${var.cluster_name}-${var.region}-aks_westeurope"
  location            = "${data.azurerm_resource_group.rg.location}"
  allocation_method   = "${var.az_public_ip_allocation_method}"
  sku                 = "${var.az_public_ip_sku}"

tags = "${var.default_tags}" 
}