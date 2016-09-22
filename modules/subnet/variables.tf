variable "app_name" {}

variable "availability_zones" {
    type = "list"
}

variable "vpc_id" {}

variable "subnets" {
    type = "list"
}

variable "route_table_id" {
    type = "list"
}

variable "map_public_ip" {
    default = "true"
}
