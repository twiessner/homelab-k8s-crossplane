# Bootstrap
Starting from a *vanilla* Kubernetes cluster, it is necessary to install and configure all the tools for the lab.
All you need is a running k8s Cluster (e.g. minikube,  AKS, ...) with sufficient administrator permissions.

## Helmfile
With this version, all the necessary charts can be installed relatively easily via [Helmfile](https://tanzu.vmware.com/developer/guides/helmfile-what-is).

### Setup (local usage on Mac)
```bash
# tools
brew install helm helmfile
# helm extension
helm plugin install https://github.com/databus23/helm-diff
# change directory 
cd helmfile/charts
# install
helmfile apply
```