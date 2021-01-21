provider "digitalocean" {
  token = var.do_token
}

# resource "digitalocean_ssh_key" "default" {
#   name       = "Default"
#   public_key = file(var.ssh_public_key_file)
# }