module "storages" {
  source = "../../modules/storage_scus"

  rg_storage   = var.rg_storage
  akv          = var.akv
  asa          = var.asa
  acr          = var.acr
  azure_region = var.azure_region
}

module "devops" {
  source = "../../modules/devops_scus"

  rg_devops               = var.rg_devops
  vnet_devops             = var.vnet_devops
  address_space_devops    = var.address_space_devops
  address_prefixes_devops = var.address_prefixes_devops
  azure_region            = var.azure_region
}


module "services" {
  source = "../../modules/services_scus"

  rg_services                = var.rg_services
  vnet_services              = var.vnet_services
  address_prefixes_services  = var.address_prefixes_services
  address_space_services     = var.address_space_services
  aadapp                     = var.aadapp
  aks                        = var.aks
  aks_version                = var.aks_version
  aks_dns_prefix             = var.aks_dns_prefix
  aks_agent_count            = var.aks_agent_count
  laws                       = var.laws
  laws_location              = var.laws_location
  laws_sku                   = var.laws_sku
  aai                        = var.aai
  aac                        = var.aac
  adnsz                      = var.adnsz
  azure_region               = var.azure_region
  ssh_public_key             = var.ssh_public_key
  acr_id                     = module.storages.acr_id
  log_analytics_workspace_id = module.storages.log_analytics_workspace_id
  pip_devops_ip_public       = module.devops.pip_devops_ip_public
}


module "datas" {
  source = "../../modules/data_scus"

  rg_data      = var.rg_data
  azure_region = var.azure_region
}
