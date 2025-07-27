resource "opennebula_image" "image-alpine" {
  name         = "test-alpine"
  description  = "ubuntu image for testing the server"
  datastore_id = opennebula_datastore.image-datastore.id
  persistent   = false
  lock         = "MANAGE"
  path         = "https://marketplace.opennebula.io/appliance/d74a5f80-20bd-013d-0e49-7875a4a4f528"
  dev_prefix   = "vd"
  driver       = "fs"
  format       = "qcow2"
  permissions  = "660"

  tags = {
    environment = "test"
  }
}