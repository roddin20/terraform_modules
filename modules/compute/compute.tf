resource "aws_instance" "instance" {
    count = "${var.instance_count}"

    ami = "${var.ami}"
    instance_type = "${var.instance_type}"

    subnet_id = "${var.subnet_id}"
    vpc_security_group_ids = ["${var.vpc_security_group_ids}"]

    user_data = "${file("${path.module}/modules/compute/cloud-config/compute.yml")}"

    tags {
        Name = "${var.app_name}-${var.instance_name}"
        Role = "${var.role}"
    }
}
