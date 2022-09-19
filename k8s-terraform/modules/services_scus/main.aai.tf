resource "azurerm_application_insights" "aai" {
  name                = var.aai
  location            = var.azure_region
  resource_group_name = var.rg_services
  workspace_id        = var.log_analytics_workspace_id
  application_type    = "web"
}
