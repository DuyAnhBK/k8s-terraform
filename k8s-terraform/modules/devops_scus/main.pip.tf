# Create an Azure Public IP Address for DevOps
resource "azurerm_public_ip" "pip_devops" {
  name                = "pip_devops"
  location            = var.azure_region
  resource_group_name = var.rg_devops
  allocation_method   = "Static"
}
