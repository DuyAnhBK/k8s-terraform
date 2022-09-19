
variable "rg_storage" {
  type        = string
  description = "The name of the Azure Resource Group for Storage"
}

variable "akv" {
  type        = string
  description = "The name of the Azure Key Vault"
}

variable "asa" {
  type        = string
  description = "The name of the Azure Storage Account"
}

variable "acr" {
  type        = string
  description = "The name of the Azure Container Registry"
}

variable "azure_region" {
  type        = string
  description = "Azure Region where you want to deploy your infrastructure"
}

variable "laws" {
  default     = "laws"
  description = "The name of the Azure Logs Analytics WorkSpace"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable "laws_sku" {
  default     = "PerGB2018"
  description = "The SKU of the Azure Logs Analytics WorkSpace"
}
