variable "rg_services" {
  type        = string
  description = "The name of the Azure Resource Group for Services"
}

variable "vnet_services" {
  type        = string
  description = "The name of the services Virtual Network"
}

variable "address_space_services" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "address_prefixes_services" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "aadapp" {
  type        = string
  description = "The name of the Azure Active Directory Application or Service Principal"
}

variable "aks" {
  type        = string
  description = "The name of the Azure Kubernetes Services"
}

variable "aks_version" {
  type        = string
  description = "The version of the Azure Kubernetes Services"
}

variable "aks_dns_prefix" {
  type        = string
  description = "The DNS prefix of the Azure Kubernetes Services"
}

variable "aks_agent_count" {
  type        = number
  description = "The Number of agents of the Azure Kubernetes Services Cluster"
}

variable "laws" {
  default     = "laws"
  description = "The name of the Azure Logs Analytics WorkSpace"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable "laws_location" {
  default     = "southcentralus"
  description = "The location of the Azure Logs Analytics WorkSpace"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable "laws_sku" {
  default     = "PerGB2018"
  description = "The SKU of the Azure Logs Analytics WorkSpace"
}

variable "aai" {
  type        = string
  description = "The name of the Azure Application Insights"
}

variable "aac" {
  type        = string
  description = "The name of the Azure Application Configuration"
}

variable "adnsz" {
  type        = string
  description = "The name of the Azure Logs Analytics WorkSpace"
}

variable "acr_id" {
  type        = string
  description = "Id of acr for scope role assigment"
}

variable "azure_region" {
  type        = string
  description = "Azure Region where you want to deploy your infrastructure"
}

variable "ssh_public_key" {
  default     = "~/.ssh/id_rsa.pub"
  description = "Public ssh key used to connect to any VM created"
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "pip_devops_ip_public" {
  type = string
}

