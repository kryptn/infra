resource "digitalocean_kubernetes_cluster" "arq" {
  name   = var.cluster_name
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

resource "digitalocean_kubernetes_node_pool" "autoscale-pool-01" {
  cluster_id = digitalocean_kubernetes_cluster.arq.id
  name       = "autoscale-pool-01"
  size       = "s-1vcpu-2gb"
  auto_scale = true
  min_nodes  = 1
  max_nodes  = 5
}


output "kubeconfig" {
  value = digitalocean_kubernetes_cluster.arq.kube_config.0.raw_config
}