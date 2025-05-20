resource "opennebula_host" "cloud-host" {
  name       = "cloud-host-kvm"
  type       = "kvm"
  cluster_id = 0

  overcommit {
    cpu    = 400
    memory = 1048576
  }

  tags = {
    environment = "cloud-host"
  }
}