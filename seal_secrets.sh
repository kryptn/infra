#!/bin/bash

kubectl -n argocd create secret generic argo-cd-github-token \
  --dry-run=client --from-env-file=secrets/github_token.env -o json > secrets/github_token.env.json \
  | kubeseal --controller-namespace sealed-secrets > apps/argo-cd/sealed-gh-token.json

kubectl -n cert-manager create secret generic cert-manager-digitalocean-token \
  --dry-run=client --from-env-file=secrets/do_token.env -o json > secrets/do_token-cm.env.json \
  | kubeseal --controller-namespace sealed-secrets > apps/cert-manager/sealed-do-token.json

kubectl -n external-dns create secret generic external-dns-digitalocean-token \
  --dry-run=client --from-env-file=secrets/do_token.env -o json > secrets/do_token-edns.env.json \
  | kubeseal --controller-namespace sealed-secrets > apps/external-dns/sealed-do-token.json

kubectl -n websub-listener create secret generic websub-listener-config-secret \
  --dry-run=client --from-file=config.toml=secrets/websub_listener_config.toml -o json > secrets/websub_listener_config.toml.json \
  | kubeseal --controller-namespace sealed-secrets > apps/websub-listener/sealed-websub-config.json