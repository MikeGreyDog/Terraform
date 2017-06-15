#openstack provider
variable "openstack_name" {
  default = "admin"
}

variable "openstack_tanent_name" {
  default = "admin"
}

variable "openstack_auth_url" {
  default = "http://192.168.103.232:5000/v2.0"
}

variable "openstack_password" {
  default = "qaz"
}

#instance
variable "instance_name" {
  default = "GitLab"
}
variable "region_name" {
  default = "RegionOne"
}
variable "img_name" {
  default = "CentOS7-installed1"
}
variable "flav_name" {
  default = "CentOS7"
}
variable "keypair_name" {
  default = "my_key_pair"
}
variable "keypair_value" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCVW3mTudeThPKc2JykMp3nvL0bNNIzuYfxitkJoLWsCHPw2DgcBgixbefQtkoy+UcKTXk5rgsRy1y2NsbbVgUFRoN/vu6ilUEtzTs++gGg2UA/rnO2zi1K1jaqqpDyEvjJjBTHJTrs3y8tXkbPwdcDX9j0Fg3OnPIvnrXunvYyhk8cs3oS/ri8LXSmwMys/avcO34i8imGigLgEfqvXG+xae6Nbpoz0AuethdkizAI6iZWGeUfPt9cdNKARZN04aAy4vFtZcEKjYRwtq21SBmdmbhUtv+leEnCHMiUW8veNB7o0DcqQfM9VNOQirY0prhTtQd/G+M9ODdPbqiqWdOZ root@localhost.localdomain"
}
variable "sec_group_name" {
  default = "default"
}
variable "net_id" {
  default = "36f5a149-1547-4ac0-8c29-f5d4083826d0"
}
variable "address" {
  default = "192.168.103.133"
}
variable "device_id" {
  default = "c4843025-bcef-4b49-9ae9-a293f29e162f"
}
variable "source_name" {
  default = "volume"
}
variable "size" {
  default = "15"
}
variable "index" {
  default = "0"
}
variable "dest_type" {
  default = "volume"
}
variable "ansible_command" {
  default = ""
}