# create an Azure storage account
resource "azurerm_storage_account" "asa" {
  name                     = var.asa
  resource_group_name      = var.rg_storage
  location                 = var.azure_region
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
