resource "opennebula_virtual_machine" "terraform_vm" {
  count       = 1
  name        = "terraform-vm-${count.index + 1}"
  description = "VM created with Terraform"

  cpu    = 1
  vcpu   = 1
  memory = 1024

  permissions = "660"

  # Context for cloud-init
  context = {
    NETWORK        = "YES"
    DNS_HOSTNAME   = "YES"
    SSH_PUBLIC_KEY = var.ssh_public_key
    PASSWORD       = var.vm_password
    HOSTNAME       = "terraform-vm-${count.index + 1}"
  }
  # Override automatic cluster requirements
  sched_requirements = "!(PUBLIC_CLOUD = YES) & !(PIN_POLICY = PINNED)"

  graphics {
    type   = "VNC"
    listen = "0.0.0.0"
    keymap = "en-us"
  }

  os {
    arch = "x86_64"
    boot = "disk0"
  }

  disk {
    image_id = opennebula_image.image-alpine.id
    size     = 20000 # Size in MB
    target   = "vda"
    driver   = "qcow2"
  }

  nic {
    model      = "virtio"
    network_id = opennebula_virtual_network.vnet-opennebula.id
  }

  tags = {
    environment = "test"
    created_by  = "terraform"
  }
}
