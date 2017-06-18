# Create a Network
#
resource "openstack_networking_network_v2" "tf_network" {
  region = ""
  name = "${net_name}"
  admin_state_up = "true"
}