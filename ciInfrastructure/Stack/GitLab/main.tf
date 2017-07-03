#provider
variable "openstack_name" {}
variable "openstack_tanent_name" {}
variable "openstack_auth_url" {}
variable "openstack_password" {}
#instance
variable "instance_name" {}
variable "region_name" {}
variable "img_name" {}
variable "flav_name" {}
#variable "keypair_name" {}
variable "sec_group_name" {}
variable "net_id" {}
/*variable "device_id" {}
variable "source_name" {}
variable "size" {}
variable "index" {}
variable "dest_type" {}*/
#variable "keypair_value" {}
variable "cnt" {}
variable "ans_ssh_user" {}
variable "ans_ssh_pass" {}
variable "server_name" {}
variable "playbook" {}
#floatingIP
//variable "pool_name" {}
#floatingIPassociate
//variable "address" {}
//variable "instance_identifier" {}
//variable "ansible_command" {}
//variable "ans_ssh_user" {}
//variable "ans_ssh_pass" {}

provider "openstack" {
  user_name = "${var.openstack_name}"
  tenant_name = "${var.openstack_tanent_name}"
  password = "${var.openstack_password}"
  auth_url = "${var.openstack_auth_url}"
}

/*module "keypair" {
  source = "../../Modules/ComputeResources/keypair"
  keypair_value = "${var.keypair_value}"
  keypair_name = "${var.keypair_name}"
  region_name = "${var.region_name}"
}*/

/*module "floatingIP" {
  source = "../../Modules/ComputeResources/floatingIP"
  region_name = "${var.region_name}"
  pool_name = "${var.pool_name}"
}*/

module "instance" {
  source = "../../Modules/ComputeResources/instance"
  instance_name = "${var.instance_name}"
  region_name = "${var.region_name}"
  img_name = "${var.img_name}"
  flav_name = "${var.flav_name}"
  #keypair_name = "${module.keypair.keypair_name_value}"
  //keypair_name = "${var.keypair_name}"
  sec_group_name = "${var.sec_group_name}"
  net_id = "${var.net_id}"
  cnt = "${var.cnt}"
  ans_ssh_user = "${var.ans_ssh_user}"
  ans_ssh_pass = "${var.ans_ssh_pass}"
  server_name = "${var.server_name}"
  playbook = "${var.playbook}"
  /*device_id = "${var.device_id}"
  source_name = "${var.source_name}"
  size = "${var.size}"
  index = "${var.index}"
  dest_type = "${var.dest_type}"
  //ansible_command = "${var.ansible_command}"
  ans_ssh_user = "${var.ans_ssh_user}"
  ans_ssh_pass = "${var.ans_ssh_pass}"*/

}

/*module "floatingIPassociate" {
  source = "../../Modules/ComputeResources/floatingIPassociate"
  region_name = "${var.region_name}"
  address = "${module.floatingIP.fip1_computed_address}"
  instance_identifier = "${module.instance.instance_identifier}"
}*/