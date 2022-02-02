#!/bin/bash

kubectl -n argocd create secret generic argo-cd-github-token \
  --dry-run=client --from-env-file=secrets/github_token.env -o json > secrets/github_token.env.json \
  | kubeseal --controller-namespace sealed-secrets > apps/argo-cd/sealed-gh-token.json

kubectl -n argocd create secret generic argo-cd-github-odic-token \
  --dry-run=client --from-env-file=secrets/github_odic_client_secret.env -o json > secrets/github_odic_client_secret.env.json \
  | kubeseal --controller-namespace sealed-secrets > apps/argo-cd/sealed-gh-odic-secret.json

kubectl -n cert-manager create secret generic cert-manager-digitalocean-token \
  --dry-run=client --from-env-file=secrets/do_token.env -o json > secrets/do_token-cm.env.json \
  | kubeseal --controller-namespace sealed-secrets > apps/cert-manager/sealed-do-token.json

kubectl -n external-dns create secret generic external-dns-digitalocean-token \
  --dry-run=client --from-env-file=secrets/do_token.env -o json > secrets/do_token-edns.env.json \
  | kubeseal --controller-namespace sealed-secrets > apps/external-dns/sealed-do-token.json

kubectl -n websub-listener create secret generic websub-listener-config-secret \
  --dry-run=client --from-file=config.toml=secrets/websub_listener_config.toml -o json > secrets/websub_listener_config.toml.json \
  | kubeseal --controller-namespace sealed-secrets > apps/websub-listener/sealed-websub-config.json

kubectl -n vaultwarden create secret generic vaultwarden-secret \
  --dry-run=client --from-env-file=secrets/vaultwarden.env -o json > secrets/vaultwarden.env.json \
  | kubeseal --controller-namespace sealed-secrets > apps/vaultwarden/sealed-vaultwarden-secret.json

kubectl -n tailscale create secret generic tailscale-auth \
  --dry-run=client --from-env-file=secrets/tailscale_key.env -o json > secrets/tailscale_key.env.json \
  | kubeseal --controller-namespace sealed-secrets > apps/tailscale/sealed-tailscale-secret.json

kubectl -n newreleases-dispatch-action create secret generic newreleases-dispatch-action-secret \
  --dry-run=client --from-env-file=secrets/newreleases-dispatch-action.env -o json > secrets/newreleases-dispatch-action.env.json \
  | kubeseal --controller-namespace sealed-secrets > apps/newreleases-dispatch-action/newreleases-dispatch-action-secret.json
