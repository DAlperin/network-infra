terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.16.2"
    }
    ansible = {
      version = "~> 1.1.0"
      source  = "ansible/ansible"
    }
  }
}

variable "vultr_key" {
 type        = string
}

provider "vultr" {
  api_key = var.vultr_key
  rate_limit = 100
  retry_limit = 3
}

resource "random_uuid" "bgp_ny_v1_id" {}

resource "vultr_instance" "bgp_ny" {
  plan = "vc2-1c-1gb"
  region = "ewr"
  os_id = 2136
  enable_ipv6 = true
  activation_email = false
  hostname = "bgp-ny-${random_uuid.bgp_ny_v1_id.result}"
  ssh_key_ids = ["d7a4c254-4ba1-4368-a9d5-63d4fb2adeeb"]
}

resource "ansible_host" "bgp_ny" {
  name = vultr_instance.bgp_ny.hostname
  groups = ["bgp"]
  variables = {
    ansible_user = "root"
    ansible_host = vultr_instance.bgp_ny.main_ip
    host_v6 = vultr_instance.bgp_ny.v6_main_ip
  }
}

resource "random_uuid" "bgp_yto_v1_id" {}

resource "vultr_instance" "bgp_yto" {
  plan = "vc2-1c-1gb"
  region = "yto"
  os_id = 2136
  enable_ipv6 = true
  activation_email = false
  hostname = "bgp-yto-${random_uuid.bgp_yto_v1_id.result}"
  ssh_key_ids = ["d7a4c254-4ba1-4368-a9d5-63d4fb2adeeb"]
}

resource "ansible_host" "bgp_yto" {
  name = vultr_instance.bgp_yto.hostname
  groups = ["bgp"]
  variables = {
    ansible_user = "root"
    ansible_host = vultr_instance.bgp_yto.main_ip
    host_v6 = vultr_instance.bgp_yto.v6_main_ip
  }
}
