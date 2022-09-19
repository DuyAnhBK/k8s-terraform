# Create a subnet for services inside the virtual network Services
resource "azurerm_subnet" "subnet_services" {
  name                 = "subnet_services"
  resource_group_name  = var.rg_services
  virtual_network_name = var.vnet_services
  address_prefixes     = var.address_prefixes_services
}
