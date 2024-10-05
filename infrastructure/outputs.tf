output "master_droplets_ips" {
  value = digitalocean_droplet.master[*].ipv4_address
}

output "worker_droplets_ips" {
  value = digitalocean_droplet.worker[*].ipv4_address
}

output "master_droplets_private_ips" {
  value = digitalocean_droplet.master[*].ipv4_address_private
}

output "worker_droplets_private_ips" {
  value = digitalocean_droplet.worker[*].ipv4_address_private
}
