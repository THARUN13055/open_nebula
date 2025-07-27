resource "opennebula_virtual_network" "vnet-opennebula" {
  name         = "tharun-vnet"
  type         = "bridge"
  bridge       = "onebr1"
  mtu          = 1500
  gateway      = "172.16.100.1"
  dns          = "172.16.100.1"
  network_mask = "255.255.255.0"

  permissions     = "642"
  group           = "oneadmin"
  security_groups = [opennebula_security_group.test_sg.id]
  cluster_ids     = [opennebula_cluster.tharun-cluster.id]
  tags = {
    env = "test"
  }

  lifecycle {
    ignore_changes = [ar]
  }

}

resource "opennebula_virtual_network_address_range" "vnet-address-range" {
  virtual_network_id = opennebula_virtual_network.vnet-opennebula.id
  ar_type            = "IP4"
  mac                = "02:00:ac:10:64:6e"
  size               = 15
  ip4                = "172.16.100.110"

  hold_ips = ["172.16.100.112", "172.16.100.114"]
}
