variable "instance_name" {}
variable "region_name" {}
variable "img_name" {}
variable "flav_name" {}
variable "keypair_name" {}
variable "sec_group_name" {}
variable "net_id" {}
variable "address" {}

variable "device_id" {}
variable "source_name" {}
variable "size" {}
variable "index" {}
variable "dest_type" {}

variable "ansible_command" {}


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

resource "openstack_compute_instance_v2" "instance" {
  force_delete = "true"
  region = "${var.region_name}"
  name = "${var.instance_name}"
  image_name = "${var.img_name}"
  flavor_name = "${var.flav_name}"
  key_pair = "${var.keypair_name}"
  security_groups = [
    "${var.sec_group_name}"]
  metadata {
    demo = "metadata"
  }
  network {
    uuid = "${var.net_id}"
    fixed_ip_v4 = "${var.address}"
  }

  block_device {
    uuid = "${var.device_id}"
    source_type = "${var.source_name}"
    volume_size = "${var.size}"
    boot_index = "${var.index}"
    destination_type = "${var.dest_type}"
    delete_on_termination = "false"
    }
/*resourse "openstack_networking_floatingip_associate_v2" "fip1" {
      //  floating_ip = "${fip1_address}"
      fixed_ip = "${var.address}"
    }*/
  provisioner "remote-exec" {
    script = "../../Scripts/wait_for_instance.sh"
  }

  provisioner "local-exec" {
    command = "${var.ansible_command}"
  }
}