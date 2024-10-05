terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.42.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}
