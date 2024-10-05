# Project
resource "digitalocean_project" "project" {
  name = var.cluster_name
  purpose = "Kubernetes Cluster"
}

resource "digitalocean_project_resources" "project_resources" {
  project = digitalocean_project.project.id
  resources = concat(digitalocean_droplet.master[*].urn, digitalocean_droplet.worker[*].urn)

  depends_on = [
    digitalocean_droplet.master,
    digitalocean_droplet.worker
  ]
}

# VPC
resource "digitalocean_vpc" "vpc" {
  name = "${var.cluster_name}-vpc"
  region = var.region
  ip_range = var.vpc_cidr
}

# Droplets
resource "digitalocean_droplet" "master" {
  name = "${var.cluster_name}-master-${count.index}"
  image = var.droplet_image
  size = var.master_droplet_size
  count = var.master_count
  region = var.region
  vpc_uuid = digitalocean_vpc.vpc.id
  monitoring = true
  ssh_keys = var.ssh_keys
}

resource "digitalocean_droplet" "worker" {
  name = "${var.cluster_name}-worker-${count.index}"
  image = var.droplet_image
  size = var.worker_droplet_size
  count = var.worker_count
  region = var.region
  vpc_uuid = digitalocean_vpc.vpc.id
  monitoring = true
  ssh_keys = var.ssh_keys
}

# Firewall
# resource "digitalocean_firewall" "firewall" {
#   name = "${var.cluster_name}-firewall"

#   inbound_rule {
#     protocol = "tcp"
#     port_range = "22"
#   }
# }

# resource "digitalocean_loadbalancer" "load_balancer" {
#   name = "${var.cluster_name}-lb"
#   region = var.region
#   vpc_uuid = digitalocean_vpc.vpc.id
#   droplet_ids = concat(digitalocean_droplet.master[*].id, digitalocean_droplet.worker[*].id)

#   forwarding_rule {
#     entry_port = 22
#     entry_protocol = "tcp"
#     target_port = 22
#     target_protocol = "tcp"
#   }

#   healthcheck {
#     port = var.healthcheck_port
#     protocol = var.healthcheck_protocol
#   }
# }
