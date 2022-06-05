###########################
# Common vars
###########################
variable "environment" {
  description = "Var used for backend container name key"
  type = string
  default = "dev"
}
variable "default_tags" {
  description = "A mapping of tags to assign to the resource."
  type = map
  default = null
}
variable "region" {
  description = "Region in which resources are deployed"
  type = string
  default = "weu"
}
###########################
# Resource groups vars
###########################
variable "resource_group_location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  default = "West Europe"
  type = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  type = string
}
###########################
# nginx Ingress Controller vars
###########################
variable "cluster_name" {
  description = "The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
  type = string
}
variable "az_public_ip_allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  type = string
  default = "Static"
}
variable "az_public_ip_sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic."
  type = string
  default = "Standard"
}
variable "nginx_helm_name" {
  description = "Release name."
  type = string
  default = "ingress-nginx"
}
variable "nginx_helm_repository" {
  description = "Repository URL where to locate the requested chart."
  type = string
  default = "https://kubernetes.github.io/ingress-nginx"
}
variable "nginx_helm_chart" {
  description = "Chart name to be installed. The chart name can be local path, a URL to a chart, or the name of the chart if repository is specified. It is also possible to use the <repository>/<chart> format here if you are running Terraform on a system that the repository has been added to with helm repo add but this is not recommended."
  type = string
  default = "ingress-nginx"
}
variable "nginx_helm_version" {
  description = "Specify the exact chart version to install. If this is not specified, the latest version is installed."
  type = string
  default = "4.0.6"
}
variable "nginx_helm_namespace" {
  description = "The namespace to install the release into. Defaults to default."
  type = string
  default = "ingress-nginx"
}
variable "nginx_helm_create_namespace" {
  description = "Create the namespace if it does not yet exist. Defaults to false."
  type = bool
  default = true
}
variable "nginx_ingress_controller_replica_count" {
  description = "The number of replicas of the Ingress Controller deployment."
  type = number
  default = 2
}
variable "nginx_ingress_controller_node_selector" {
  description = "The node selector for pod assignment for the Ingress Controller pods."
  type = string
  default = "linux"
}
variable "nginx_ingress_defaultBackend_node_selector" {
  description = "The node selector for backend"
  type = string
  default = "linux"
}
variable "nginx_ingress_controller_service_annotations" {
  description = "Azure dns label name for public IP address"
  type = string
  default = "defaultbackend001"
}