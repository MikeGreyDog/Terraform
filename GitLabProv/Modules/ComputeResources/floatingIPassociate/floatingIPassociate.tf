variable "address" {}
variable "instance_identifier" {}
variable "region_name" {}

resource "openstack_compute_floatingip_associate_v2" "myip" {
  region = "${var.region_name}"
  floating_ip = "${var.address}"
  instance_id = "${var.instance_identifier}"
}