
locals {
  location_lower = lower(var.location)
  location       = replace(local.location_lower, " ", "-")
}

resource "azurerm_resource_group" "aks" {
  name     = "rg-aks-${local.location}"
  location = var.location
}