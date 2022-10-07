# ArgoCD

ArgoCD can be used to automatically deploy resources into a k8s cluster. It will watch a configured git-repository or helm-chart for changes and keep them in sync with the k8s cluster.

ArgoCD can even manage itself via CRDs in the k8s clsuter, which is what we are doing. We're setting up ArgoCd using the (App of Apps Pattern)[https://argo-cd.readthedocs.io/en/stable/operator-manual/cluster-bootstrapping/#app-of-apps-pattern]. Only manual thing needed is the deployment of the initial Application, that manages all other Applications in ArgoCD.

```
$ kubectl apply -f 01-application_master.yml
```
