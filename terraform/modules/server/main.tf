terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 0.13"
}

resource "twc_vpc" "k3s-vpc" {
  name = "K3S-VPC"
  description = "k3s VPC"
  subnet_v4 = "192.168.0.0/24"
  location = "AMS-1"
}

data "twc_configurator" "configurator" {
  location = "AMS-1"
  disk_type = "nvme"
}

data "twc_os" "os" {
  name = "ubuntu"
  version = "22.04"
}

resource "twc_server" "example-server" {
  name = "k3s"
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