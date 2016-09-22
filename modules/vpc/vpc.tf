resource "aws_vpc" "vpc" {
    cidr_block = "${var.vpc_cidr}"
    tags {
        Name = "${var.app_name}-vpc"
    }
}

resource "aws_internet_gateway" "igw" {
    count = "${var.enable_internet_gw}"

    vpc_id = "${aws_vpc.vpc.id}"
    depends_on = ["aws_vpc.vpc"]
    tags {
        Name = "${var.app_name}-igw"
    }
}

resource "aws_route_table" "default-route-table" {
    vpc_id = "${aws_vpc.vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }
    depends_on = ["aws_vpc.vpc", "aws_internet_gateway.igw"]
    tags {
        Name = "${var.app_name}-default-route-table}"
    }
}

output "vpc_id" {
    value = "${aws_vpc.vpc.id}"
}
output "igw_id" {
    value = "${aws_internet_gateway.igw.id}"
}
output "default-tour-table_id" {
    value = "${aws_route_table.default-route-table.id}"
}
