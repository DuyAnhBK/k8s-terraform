# Create a virtual network within the resource group DevOps
resource "azurerm_virtual_network" "vnet_devops_scus" {
  name                = var.vnet_devops
  resource_group_name = var.rg_devops
  location            = var.azure_region
  address_space       = var.address_space_devops
}
