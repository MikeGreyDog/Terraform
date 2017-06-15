variable "keypair_value" {}
variable "keypair_name" {}
variable "region_name" {}

variable "openstack_name" {}
variable "openstack_tanent_name" {}
variable "openstack_auth_url" {}
variable "openstack_password" {}

provider "openstack" {
  user_name = "${var.openstack_name}"
  tenant_name = "${var.openstack_tanent_name}"
  password = "${var.openstack_password}"
  auth_url = "${var.openstack_auth_url}"

}

resource "openstack_compute_keypair_v2" "my_key_pair" {
  name = "${var.keypair_name}"
  region = "${var.region_name}"
  public_key = "${var.keypair_value}"
}

output "keypair_name_value" {
  value = "${openstack_compute_keypair_v2.my_key_pair.name}"
}