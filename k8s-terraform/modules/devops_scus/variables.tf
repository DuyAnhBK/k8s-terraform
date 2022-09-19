variable "rg_devops" {
  type        = string
  description = "The name of the Azure Resource Group for DevOps"
}

variable "vnet_devops" {
  type        = string
  description = "The name of the devops Virtual Network"
}

variable "address_space_devops" {
  type    = list(string)
  default = ["11.0.0.0/16"]
}

variable "address_prefixes_devops" {
  type    = list(string)
  default = ["11.0.1.0/24"]
}

variable "azure_region" {
  type        = string
  description = "Azure Region where you want to deploy your infrastructure"
}
