data "template_file" "user_data" {
    template = "${file("${path.module}/cloud-config/compute.yml")}"

    vars {
        ssh_pub_key = "${var.ssh_pub_key}"
    }
}

resource "aws_instance" "instance" {
    count = "${var.instance_count}"

    ami = "${var.ami}"
    instance_type = "${var.instance_type}"

    subnet_id = "${var.subnet_id}"
    vpc_security_group_ids = ["${var.vpc_security_group_ids}"]

    user_data = "${data.template_file.user_data.rendered}"

    tags {
        Name = "${var.app_name}-${var.instance_name}"
        Role = "${var.role}"
    }
}
