terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.token
}

resource "digitalocean_vpc" "k3s" {
  name   = var.vpc_name
  region = var.vpc_region
}

resource "digitalocean_droplet" "example" {
  name   = var.droplet_name
  image  = var.droplet_image
  size   = var.droplet_size
  region = var.vpc_region
  vpc_uuid = digitalocean_vpc.k3s.id
}
