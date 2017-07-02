# Attach the Router to our Network via an Interface
#
resource "openstack_networking_router_interface_v2" "tf_rtr_if_1" {
  region = ""
  router_id = "${openstack_networking_router_v2.tf_router1.id}"
  subnet_id = "${openstack_networking_subnet_v2.tf_net_sub1.id}"
}
