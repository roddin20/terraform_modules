variable "app_name" {}
variable "instance_name" {}
variable "role" {}

variable "instance_count" {
    default = "1"
}

variable "ami" {}
variable "instance_type" {}

variable "subnet_id" {}
variable "vpc_security_group_ids" { type = "list" }

variable "ssh_pub_key" {}
