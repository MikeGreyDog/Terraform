variable "instance_name" {}
variable "region_name" {}
variable "img_name" {}
variable "flav_name" {}
#variable "keypair_name" {}
variable "sec_group_name" {}
variable "net_id" {}
variable "cnt" {}
variable "ans_ssh_user" {}
variable "ans_ssh_pass" {}
variable "server_name" {}
variable "playbook" {}

//variable "device_id" {}
//variable "source_name" {}
//variable "size" {}
//variable "index" {}
//variable "dest_type" {}

//variable "ansible_command" {}
//variable "ans_ssh_user" {}
//variable "ans_ssh_pass" {}



resource "openstack_compute_instance_v2" "instance" {
  count = "${var.cnt}"
  force_delete = "true"
  region = "${var.region_name}"
  name = "${var.instance_name}-${count.index}"
  image_name = "${var.img_name}"
  flavor_name = "${var.flav_name}"
 #key_pair = "${var.keypair_name}"
  security_groups = [
    "${var.sec_group_name}"]
  metadata {
    demo = "metadata"
  }
  network {
    uuid = "${var.net_id}"
  }

 /* block_device {
    uuid = "${var.device_id}"
    source_type = "${var.source_name}"
    volume_size = "${var.size}"
    boot_index = "${var.index}"
    destination_type = "${var.dest_type}"
    delete_on_termination = "false"
    }*/
}

output "instance_identifier" {
  value = "${openstack_compute_instance_v2.instance.id}"
}
output "instance_address" {
  value = "${openstack_compute_instance_v2.instance.access_ip_v4}"
}

resource "null_resource" "GitLabProvision" {
  provisioner "local-exec" {
    command = "sleep 40 && echo -e \"[${var.server_name}]\n${openstack_compute_instance_v2.instance.access_ip_v4} ansible_connection=ssh ansible_ssh_user=${var.ans_ssh_user} ansible_ssh_pass=${var.ans_ssh_pass}\" >> /home/ansible-pay/Ansible/hosts &&  ansible-playbook -i /home/ansible-pay/Ansible/hosts ${var.playbook}"
  }
depends_on = ["openstack_compute_instance_v2.instance"]
}
