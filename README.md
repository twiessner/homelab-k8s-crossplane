
# Introduction
This Homelab is aimed at testing Infrastructure as Code based on Kubernetes as an alternative to established technologies such as Terraform. Our technology stack consists of:

- [Kubernetes](https://kubernetes.io) on [Azure Kubernetes Service](https://azure.microsoft.com/en-us/products/kubernetes-service)
- [ArgoCD](https://argo-cd.readthedocs.io)
- [Helmfile](https://tanzu.vmware.com/developer/guides/helmfile-what-is)
- [Crossplane](https://crossplane.io)

Also important is a fully automated overall process with GitOps, which allows flexible and independent management of resources and manifest files.

# Directory k8s
This directory contains only the fundamental Kubernetes addons

- [ArgoCD](https://argo-cd.readthedocs.io)
- [Prometheus](https://prometheus.io)

The deployment was done by [Helmfile](https://tanzu.vmware.com/developer/guides/helmfile-what-is) to gain more experience with this technology.

# Directory infrastructure
This directory contains the Azure resources for the Kubernetes cluster, which acts as the worker infrastructure. The following are used

- [Terraform](https://www.terraform.io)
- [Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

## Provisioning
> Note: You need Azure RBAC Contributor permissions on your Subscription.

```bash
# 1. Export required environment variables for terraform
export ARM_TENANT_ID=<your Azure tenant id>
export ARM_SUBSCRIPTION_ID=<your Azure subscription id> 

# 2. Create a Terraform remote backend (well hard coded at the moment)
# Maybe install Azure CLI (example for MacOS)
brew install azure-cli
# Login to your Azure account
az login
# create the resource group
az group create -n rg-homelab-mgnt-westeu -l westeurope
# create the storage account
az storage account create -n sthomelabtfbackend001 \
   -g rg-homelab-mgnt-westeu -l westeurope --sku Standard_LRS
# create the storage blob container
az storage container create -n tfstate --account-name sthomelabtfbackend001

# execute terraform
cd infrastructure/azure/terraform

terraform init -upgrade
terraform apply
```

# More resources
The second part of the Homelab is the [Git repository](https://github.com/twiessner/homelab-k8s-crossplane-argocd), which contains the actual 
ArgoCD applications that implement the logic for the rest of the process.

# Outcomes (what we have learned)

- Setup of AKS is easy to implement
- Installation of ArgoCD could also have been done directly via the [Terraform Helm provider](https://registry.terraform.io/providers/hashicorp/helm)
- Helmfile is a nice tool
- Bootstraping a Kubernetes cluster using ArgoCD is a great decoupled way to separate infrastructure from application layer
- Crossplane for Azure was disappointing
  - Installation via ArgoCD is easy to implement
  - Documentation is incomplete and requires frequent googling and code reverse engineered 
  - The functional scope is very small (approx. 20 Azure resources)

> The hope for a productive use and possibly a replacement of Terraform has not been fulfilled. 
> Nevertheless, it was a great and instructive time. Perhaps the PoC can be reactivated once again after a rest period.

