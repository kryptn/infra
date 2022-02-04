resource "digitalocean_kubernetes_cluster" "arq" {
  name   = var.cluster_name
  region = var.do_region
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.19.15-do.0"
  # tags    = ["staging"]

  # auto_upgrade  = true
  surge_upgrade = true
  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 4
  }

}



output "kubeconfig" {
  value = digitalocean_kubernetes_cluster.arq.kube_config.0.raw_config
}
