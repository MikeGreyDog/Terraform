variable "instance_name" {}
variable "region_name" {}
variable "img_name" {}
variable "flav_name" {}
variable "keypair_name" {}
variable "sec_group_name" {}
variable "net_id" {}
variable "device_id" {}
variable "source_name" {}
variable "size" {}
variable "index" {}
variable "dest_type" {}

variable "ansible_command" {}


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
  }

  block_device {
    uuid = "${var.device_id}"
    source_type = "${var.source_name}"
    volume_size = "${var.size}"
    boot_index = "${var.index}"
    destination_type = "${var.dest_type}"
    delete_on_termination = "false"
    }
}

output "instance_identifier" {
  value = "${openstack_compute_instance_v2.instance.id}"
}

resource "null_resource" "GitLabProvision" {
  provisioner "local-exec" {
    command = "${var.ansible_command}"
  }
depends_on = ["openstack_compute_instance_v2.instance"]
}