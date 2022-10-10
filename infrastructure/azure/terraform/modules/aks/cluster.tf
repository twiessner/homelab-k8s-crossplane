
resource "azurerm_kubernetes_cluster" "aks" {
  name                = join("-", ["aks", var.scope, var.location.short, var.instance])
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = join("-", ["aks", var.scope])
  kubernetes_version  = "1.24" #see: az aks get-versions --location westeurope --output table

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}