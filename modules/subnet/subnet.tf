resource "aws_subnet" "subnets" {
    count = "${length(var.subnets)}"

    availability_zone = "${element(var.availability_zones, count.index)}"
    cidr_block = "${element(var.subnets, count.index)}"
    vpc_id = "${var.vpc_id}"
    map_public_ip_on_launch = "${var.map_public_ip}"
    tags {
        Name = "${var.app_name}-subnet-${element(var.subnets, count.index)}"
    }
}

resource "aws_route_table_association" "route_assoc" {
    count = "${length(var.subnets)}"

    subnet_id = "${element(aws_subnet.subnets.*.id, count.index)}"
    route_table_id = "${var.route_table_id}"
    depends_on = ["aws_subnet.subnets"]
}

output "subnet_ids" {
    value = "${aws_subnet.subnets.*.id}"
}
