terraform {
  required_providers {
    opennebula = {
      source  = "OpenNebula/opennebula" # Correct provider source
      version = "~> 1.4"
    }
  }
}

provider "opennebula" {
  endpoint = "http://172.16.7.128:2633/RPC2"
  username = "oneadmin"
  password = "changeme123"
  insecure = true
}