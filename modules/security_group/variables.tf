variable "app_name" {}
variable "description" {}
variable "name" {}

variable "sg_rule_types" { type="map" }
variable "sg_rule_from_ports" { type="map" }
variable "sg_rule_to_ports" { type="map" }
variable "sg_rule_protocols" { type="map" }
variable "sg_rule_cidr_blocks" { type="map" }
