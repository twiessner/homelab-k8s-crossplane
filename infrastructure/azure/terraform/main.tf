
locals {
  tags = {
    env = "homelab"
  }
  scope = "homelab"
}

module "aks" {
  source = "./modules/aks"

  scope = local.scope
  tags  = local.tags
}

module "billing" {
  source = "./modules/billing"

  scope = local.scope
  tags  = local.tags
}