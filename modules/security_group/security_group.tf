resource "aws_security_group" "security_group" {
    name = "${var.name}"
    description = "${var.description}"

    tags {
        Name = "${var.app_name}-sg-${var.name}"
    }
}

resource "aws_security_group_rule" "sg_rules" {
    count = "${length(var.sg_rule_types)}"

    type = "${lookup(var.sg_rule_types, count.index)}"
    from_port = "${lookup(var.sg_rule_from_ports, count.index)}"
    to_port = "${lookup(var.sg_rule_to_ports, count.index)}"
    protocol = "${lookup(var.sg_rule_protocols, count.index)}"
    cidr_blocks = "${split(",", lookup(var.sg_rule_cidr_blocks, count.index))}"

    security_group_id = "${aws_security_group.security_group.id}"
}

output "security_group_id" {
    value = "${aws_security_group.security_group.id}"
}
