variable "app_name" {}

variable "availability_zones" {
    type = "list"
}

variable "vpc_id" {}

variable "subnets" {
    type = "list"
}
