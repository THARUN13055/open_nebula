resource "opennebula_template" "vm_template" {
  name        = "terraform-vm-template"
  description = "VM template created with Terraform"
  
  cpu    = 1
  vcpu   = 1
  memory = 1024
  
  # Use the same scheduler requirements as your working manual template
  sched_requirements = "(HYPERVISOR=kvm)"
  
  disk {
    image_id = opennebula_image.image-alpine.id
    size     = 20000
    target   = "vda"
    driver   = "qcow2"
  }
  
  nic {
    model      = "virtio"
    network_id = opennebula_virtual_network.vnet-opennebula.id
  }
  
  graphics {
    type   = "VNC"
    listen = "0.0.0.0"
    keymap = "en-us"
  }
  
  os {
    arch = "x86_64"
    boot = "disk0"
  }
  
  context = {
    NETWORK        = "YES"
    DNS_HOSTNAME   = "YES"
    SSH_PUBLIC_KEY = var.ssh_public_key
    PASSWORD       = var.vm_password
  }
  
  tags = {
    environment = "test"
    created_by  = "terraform"
  }
}
