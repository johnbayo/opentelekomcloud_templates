variable "natgw_name" {type = "list"}
variable "natgw_count" {}
variable "natgw_rule_count" {}
variable "natgw_subnet_index" {type = "list"}
variable "natgw_rule_eip_index" {type = "list"}
variable "natgw_rule_gw_index" {type = "list"}
variable "natgw_size" {
  description = "size of the nat gw" # 1 - small, 2 - medium, 3 - large, 4 - extra large
  default     = 1
}
