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

