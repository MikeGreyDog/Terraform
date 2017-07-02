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
variable "keypair_value" {}
variable "cnt" {}
variable "ans_ssh_user" {}
variable "ans_ssh_pass" {}
variable "server_name" {}
variable "playbook" {}

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

module "instance" {
  source = "../../Modules/ComputeResources/instance"
  instance_name = "${var.instance_name}"
  region_name = "${var.region_name}"
  img_name = "${var.img_name}"
  flav_name = "${var.flav_name}"
  #keypair_name = "${module.keypair.keypair_name_value}"
  sec_group_name = "${var.sec_group_name}"
  net_id = "${var.net_id}"
  cnt = "${var.cnt}"
  ans_ssh_user = "${var.ans_ssh_user}"
  ans_ssh_pass = "${var.ans_ssh_pass}"
  server_name = "${var.server_name}"
  playbook = "${var.playbook}"

}
