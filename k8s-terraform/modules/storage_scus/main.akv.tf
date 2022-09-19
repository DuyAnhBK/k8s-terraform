data "azurerm_client_config" "current" {}

# create an azure key vault service
resource "azurerm_key_vault" "storage_akv" {
  name                        = var.akv
  location                    = var.azure_region
  resource_group_name         = var.rg_storage
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true

  sku_name = "standard"
}
