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

output "vpc_id" {
    value = "${aws_vpc.vpc.id}"
}
output "igw_id" {
    value = "${aws_internet_gatewat.igw.id}"
}
