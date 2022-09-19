# Create an Azure container registry
resource "azurerm_container_registry" "acr" {
  name                = var.acr
  resource_group_name = var.rg_storage
  location            = var.azure_region
  sku                 = "Basic"
  admin_enabled       = false
}
