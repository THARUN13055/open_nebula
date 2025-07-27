# resource "opennebula_template" "vm-template" {
#   name        = "test-alpine-template"
#   description = "VM alpine template"
#   cpu         = 1
#   vcpu        = 1
#   memory      = 2048
#   permissions = "660"

#   graphics {
#     type   = "VNC"
#     listen = "0.0.0.0"
#     keymap = "en-us"
#   }

#   os {
#     arch = "x86_64"
#     boot = "disk0"
#   }

#   disk {
#     image_id = opennebula_image.image-alpine.id
#     size     = 10000
#     target   = "vda"
#     driver   = "qcow2"
#   }

#   nic {
#     model           = "virtio"
#     network_id      = opennebula_virtual_network.vnet-opennebula.id
#     security_groups = [opennebula_security_group.test_sg.id]
#   }
# }