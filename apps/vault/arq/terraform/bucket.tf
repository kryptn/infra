resource "digitalocean_spaces_bucket" "vault" {
  name   = var.bucket_name
  region = var.do_region

  acl = "private"
}

output "endpoint" {
    value = digitalocean_spaces_bucket.vault.bucket_domain_name
}

output "bucket_name" {
    value = digitalocean_spaces_bucket.vault.name
}

output "region" {
    value = digitalocean_spaces_bucket.vault.region
}