###########################################
# Brock Palen
# brockp@umich.edu
# http://arc-ts.umich.edu/

resource "openstack_networking_network_v2" "internal-network" {
  name           = "${var.internal-network["network-name"]}"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "network_subnet_1" {
  name       = "${var.internal-network["subnet-name"]}"
  network_id = "${openstack_networking_network_v2.internal-network.id}"
  cidr       = "${var.internal-network["subnet-cidr"]}"
  ip_version = 4
}

resource "openstack_networking_router_v2" "router_1" {
  name             = "${var.internal-network["router-name"]}"
  admin_state_up   = true
  external_gateway = "${var.internal-network["external-gateway"]}"
}

resource "openstack_networking_router_interface_v2" "public_router_interface_1" {
  router_id = "${openstack_networking_router_v2.router_1.id}"
  subnet_id = "${openstack_networking_subnet_v2.network_subnet_1.id}"
}

resource "openstack_networking_secgroup_v2" "secgroup_1" {
  name        = "${var.secgroup}"
  description = "My brockp neutron security group"
}

resource "openstack_networking_secgroup_rule_v2" "ssh-ingress" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.secgroup_1.id}"
}

resource "openstack_networking_floatingip_v2" "floatip_1" {
  count = "${var.quantity}"
  pool  = "public"
}
