variable "region_name" {}
variable "pool_name" {}

resource "openstack_compute_floatingip_v2" "fip1" {
  region = "${var.region_name}"
  pool = "${var.pool_name}"
}

output "fip1_computed_address" {
  value = "${openstack_compute_floatingip_v2.fip1.address}"
}