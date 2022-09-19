resource "azurerm_log_analytics_workspace" "laws" {
  # the workspace name has to be unique across the whole of azure, not just the current subscription/tenant
  name                = var.laws
  location            = var.azure_region
  resource_group_name = var.rg_storage
  sku                 = var.laws_sku

  lifecycle {
    ignore_changes = [
      name,
    ]
  }
}

resource "azurerm_log_analytics_solution" "las" {
  solution_name         = "ContainerInsights"
  location              = azurerm_log_analytics_workspace.laws.location
  resource_group_name   = var.rg_storage
  workspace_resource_id = azurerm_log_analytics_workspace.laws.id
  workspace_name        = azurerm_log_analytics_workspace.laws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

