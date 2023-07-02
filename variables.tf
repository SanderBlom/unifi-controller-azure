variable "deployment_resource_group_name" {
  description = "The name of the resource group created for the current environment."
  type        = string
}

variable "project_name" {
  description = "Short name of the project."
  type        = string
  default     = "unificontroller"
}

variable "location" {
  description = "Azure region where resources will deploy to"
  type        = string
  default     = "norwayeast"
}

variable "environment" {
  description = "The current deployment environment we are in."
  type        = number
  default     = 2 #Dev 
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "vnet_name" {
  description = "Name of the vnet"
  type        = string
}

variable "vnet_RG" {
  description = "Name of the vnets resource group"
  type        = string
}