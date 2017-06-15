/*module "openstack" {
  source = "c:/users/admin/IdeaProjects/GitLabProv/Modules/Providers/openstack"
  openstack_name = "${var.openstack_name}"
  openstack_tanent_name = "${var.openstack_tanent_name}"
  openstack_auth_url = "${var.openstack_auth_url}"
  openstack_password = "${var.openstack_password}"
}
*/
/*module "network" {
  source = "/GitLabProv/Modules/NetworkResources/network"
}

module "router" {
  source = "/GitLabProv/Modules/NetworkResources/router"
}

module "routerInterface" {
  source = "/GitLabProv/Modules/NetworkResources/routerInterface"
}
*/
module "keypair" {

  openstack_name = "${var.openstack_name}"
  openstack_tanent_name = "${var.openstack_tanent_name}"
  openstack_auth_url = "${var.openstack_auth_url}"
  openstack_password = "${var.openstack_password}"

  source = "../../Modules/ComputeResources/keypair"
  keypair_value = "${var.keypair_value}"
  keypair_name = "${var.keypair_name}"
  region_name = "${var.region_name}"
}

module "instance" {
  source = "../../Modules/ComputeResources/instance"

  openstack_name = "${var.openstack_name}"
  openstack_tanent_name = "${var.openstack_tanent_name}"
  openstack_auth_url = "${var.openstack_auth_url}"
  openstack_password = "${var.openstack_password}"

  instance_name = "${var.instance_name}"
  region_name = "${var.region_name}"
  img_name = "${var.img_name}"
  flav_name = "${var.flav_name}"
  keypair_name = "${module.keypair.keypair_name_value}"
  sec_group_name = "${var.sec_group_name}"
  net_id = "${var.net_id}"
  address = "${var.address}"
  device_id = "${var.device_id}"
  source_name = "${var.source_name}"
  size = "${var.size}"
  index = "${var.index}"
  dest_type = "${var.dest_type}"
  ansible_command = "${var.ansible_command}"
}

