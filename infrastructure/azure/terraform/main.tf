
module "aks" {
  source = "./modules/aks"

  scope = "homelab"

  tags = {
    env = "homelab"
  }
}