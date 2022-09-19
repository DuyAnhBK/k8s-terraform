output "acr_id" {
  value = azurerm_container_registry.acr.id
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.laws.id
}
