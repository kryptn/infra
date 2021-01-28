# infra

install [taskfile](https://taskfile.dev/#/installation)
install [kustomize](https://kubectl.docs.kubernetes.io/installation/kustomize/source/)
install [kubeseal](https://github.com/bitnami-labs/sealed-secrets/releases/tag/v0.14.1)

set your secrets in `secrets/`
set your secrets/vars in `do-cluster`

```bash
# init tf
task cluster:init

# create cluster
task cluster:create
task argocd:bootstrap
source seal_secrets.sh
task argocd:bootstrap
task argocd:deploy-core
```


secrets:

https://github.com/bitnami-labs/sealed-secrets/releases/tag/v0.14.1