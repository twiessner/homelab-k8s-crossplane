
resource "azurerm_resource_group" "aks" {
  name     = join("-", ["rg", var.scope, "aks", var.location.short])
  location = var.location.name
  tags     = var.tags
}