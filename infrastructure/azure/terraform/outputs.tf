
output "kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}