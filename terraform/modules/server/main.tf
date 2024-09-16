terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 0.13"
}

provider "twc" {
  token = var.token
}

resource "twc_vpc" "k3s-vpc" {
  name = var.vpc_name
  description = "k3s VPC"
  subnet_v4 = "192.168.0.0/24"
  location = var.vpc_region
}

data "twc_configurator" "configurator" {
  location = var.vpc_region
  disk_type = "nvme"
}

data "twc_os" "os" {
  name = "ubuntu"
  version = "22.04"
}

resource "twc_server" "k3s" {
  name = var.server_name
  os_id = data.twc_os.os.id

  configuration {
    configurator_id = data.twc_configurator.configurator.id
    disk = 51200
    cpu = 2
    ram = 4096
  }

  local_network {
    id = twc_vpc.k3s-vpc.id
  }
}

resource "twc_server_ip" "k3s" {
  source_server_id = twc_server.k3s.id

  type = "ipv4"
}