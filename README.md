# infra

install [taskfile](https://taskfile.dev/#/installation)

```
task cluster:create
task argocd:bootstrap
source seal_secrets.sh
task argocd:bootstrap
task argocd:deploy-core
```


secrets:

https://github.com/bitnami-labs/sealed-secrets/releases/tag/v0.14.1