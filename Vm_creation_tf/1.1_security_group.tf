resource "opennebula_security_group" "test_sg" {
  name        = "test-security-group"
  description = "Terraform security group"

  rule {
    protocol  = "ALL"
    rule_type = "OUTBOUND"
  }

  rule {
    protocol  = "TCP"
    rule_type = "INBOUND"
    range     = "22"
  }

  tags = {
    environment = "test"
  }
}