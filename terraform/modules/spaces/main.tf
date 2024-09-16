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
  spaces_access_id  = var.access_key
  spaces_secret_key = var.secret_key
}

resource "digitalocean_spaces_bucket" "s3-deutschhub" {
  name   = var.space_dutschhub
  region = var.region
}

resource "digitalocean_spaces_bucket" "s3-deutschlern" {
  name   = var.space_dutschlern
  region = var.region
}