# Create a router for our network
#
resource "openstack_networking_router_v2" "tf_router1" {
  region = ""
  name = "${router_name}"
  admin_state_up = "true"
  external_gateway = "${ext_gateway_value}"
}
