# infra

- install [just](https://github.com/casey/just)
- install [kustomize](https://kubectl.docs.kubernetes.io/installation/kustomize/source/)
- install [kubeseal](https://github.com/bitnami-labs/sealed-secrets)
- install [helm](https://helm.sh/docs/)

All secrets for now are sealed secrets

## Set up your cluster

I have this set up with digitalocean today. check [the vars file](./cloud/digitalocean/vars.tf) and config as necessary.

you should leave this step with a valid kubectl context loaded, wherever your cluster is

### Full Cluster Bootstrap

- set argocd secrets
    - github personal access token
    - github app for oidc auth
- set external-dns secret
    - digitalocean api key
- set cert-manager secret
    - digitalocean api key


deploy sealed secrets and ingress-nginx

`just ./argocd-bootstrap/ step1`

re-seal all secrets with fresh key

`just ./argocd-bootstrap/ step2`

deploy cert-manager and external-dns

`just ./argocd-bootstrap/ step3`

deploy argocd

`just ./argocd-bootstrap/ step4`

deploy any projects/applications. ideally these will claim ownership of all resources already deployed

`just ./argocd-bootstrap/ step5`

