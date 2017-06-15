output "fip1_address" {
  value = "${openstack_compute_floatingip_v2.fip1.address}"
}