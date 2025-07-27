# Image Datastore
resource "opennebula_datastore" "image-datastore" {
  name        = "tharun-image-ds"
  type        = "image"
  cluster_ids = [opennebula_cluster.tharun-cluster.id]

  check_available_capacity = true
  driver                   = "fs"
  staging_dir              = "/var/tmp"
  restricted_directories   = ""

  custom {
    datastore = "fs"
    transfer  = "shared"
  }

  tags = {
    environment = "test"
    type        = "image"
  }
}

# System Datastore
resource "opennebula_datastore" "system-datastore" {
  name        = "tharun-system-ds"
  type        = "system"
  cluster_ids = [opennebula_cluster.tharun-cluster.id]

  driver      = "fs"
  staging_dir = "/var/tmp"

  custom {
    datastore = "fs"
    transfer  = "shared"
  }

  tags = {
    environment = "test"
    type        = "system"
  }
}
