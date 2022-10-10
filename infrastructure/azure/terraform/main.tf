
module "aks" {
  source = "./modules/aks"

  tags = {
    env = "homelab"
  }
}