resource "opennebula_cluster" "tharun-cluster" {
  name = "tharun01"

  tags = {
    environment = "test"
  }
}
