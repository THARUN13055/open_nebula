variable "ssh_public_key" {
  description = "SSH public key for VM access"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICxYb36nEKg8vh9lCyMPU+w2gInAKIl8sp3m8cCU7f1i terraform-opennebula"
}

variable "vm_password" {
  description = "Root password for VMs"
  type        = string
  sensitive   = true
  default     = "babyboss"
}
