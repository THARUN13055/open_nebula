resource "opennebula_host" "host-kvm" {
  name       = "test-host-kvm"
  type       = "kvm"
  cluster_id = opennebula_cluster.tharun-cluster.id

  overcommit {
    cpu    = 200     # 2 cores
    memory = 1048576 # 1 Gb
  }

  tags = {
    environment = "test"
  }
}