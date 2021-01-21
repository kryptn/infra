


resource "digitalocean_kubernetes_cluster" "arq" {
  name   = "arq"
  region = var.do_region
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.19.3-do.3"
  # tags    = ["staging"]

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 3
  }

}

resource "digitalocean_record" "www" {
    domain = "arq.dev"
    type = "A"
    name = "www"
    value = "134.209.143.84"
}

resource "digitalocean_record" "self" {
    domain = "arq.dev"
    type = "A"
    name = "@"
    value = "134.209.143.84"
}

output "kubeconfig" {
  value = digitalocean_kubernetes_cluster.arq.kube_config.0.raw_config
}