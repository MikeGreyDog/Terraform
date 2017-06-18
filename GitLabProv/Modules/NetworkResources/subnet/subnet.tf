# Create a subnet in our new network
# Notice here we use a TF variable for the name of our network above.
#
resource "openstack_networking_subnet_v2" "tf_net_sub1" {
  region = ""
  network_id = "${openstack_networking_network_v2.tf_network.id}"
  cidr = "192.168.103.128/25"
  ip_version = 4
}