
# Introduction
HomeLab for implementing Infrastructure as Code with [Kubernetes](https://kubernetes.io) over [Crossplane](https://crossplane.io). 
In addition, an automatic deployment of all changes via a GitOps ([ArgoCD](https://argo-cd.readthedocs.io)) workflow is to be ensured.

# Administration
> Note: you need *Global administrator* privileges to execute the following steps.

Create an [Azure service principle](https://crossplane.io/docs/v1.9/cloud-providers/azure/azure-provider.html) for rbac, used by crossplane as k8s secret later on:

```bash
# Create service principal 
az ad sp create-for-rbac -n crossplane-application --role Owner --scopes <your subscription resource id>
# Save the created app id for further usage
export AZURE_CLIENT_ID=<App Id>
# Grant required permissions
az ad app permission grant --id ${AZURE_CLIENT_ID} --api 00000002-0000-0000-c000-000000000000 --scope Directory.Read.All
# Grant Admin consent
az ad app permission admin-consent --id "${AZURE_CLIENT_ID}"
# 
BASE64ENCODED_AZURE_ACCOUNT_CREDS=$(base64 -i crossplane-azure-provider-key.json | tr -d "\n")
#
cat <<EOF | kubectl apply -f -
---
apiVersion: v1
kind: Secret
metadata:
  name: azure-account-creds
  namespace: crossplane-system
type: Opaque
data:
  credentials: ${BASE64ENCODED_AZURE_ACCOUNT_CREDS}
---
apiVersion: azure.crossplane.io/v1beta1
kind: ProviderConfig
metadata:
  name: default
spec:
  credentials:
    source: Secret
    secretRef:
      namespace: crossplane-system
      name: azure-account-creds
      key: credentials
EOF
```

# Directory k8s
* ToDo - Describe the bootstrapping of AKS via Terraform

# Directory infrastructure
* ToDo - Describe provisioning of Crossplane via Argo-CD