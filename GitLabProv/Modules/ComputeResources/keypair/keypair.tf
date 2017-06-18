variable "keypair_value" {}
variable "keypair_name" {}
variable "region_name" {}

resource "openstack_compute_keypair_v2" "my_key_pair" {
  name = "${var.keypair_name}"
  region = "${var.region_name}"
  public_key = "${var.keypair_value}"
}

output "keypair_name_value" {
  value = "${openstack_compute_keypair_v2.my_key_pair.name}"
}