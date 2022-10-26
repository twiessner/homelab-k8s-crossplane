
resource "azurerm_resource_group" "billing" {
  name     = join("-", ["rg", var.scope, "billing", var.location.short])
  location = var.location.name
  tags     = var.tags
}