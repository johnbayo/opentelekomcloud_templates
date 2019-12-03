##############################################
# security-group
##############################################
variable "sg_name" {
  description = "security group name"
  type        = "list"
}

variable "sg_count" {
  description = "number of security groups"
}

############################
variable "ip_sg_rules_count" {
  description = "number of security groups"
}

variable "sg_sg_rules_count" {
  description = "number of security groups"
}

variable "sg_lower_port" {
  description = "security group name"
  type        = "list"
}

variable "sg_upper_port" {
  description = "security group name"
  type        = "list"
}

variable "sg_proto" {
  description = "security rule protocol"
  type        = "list"
}

variable "ip_lower_port" {
  description = "security group name"
  type        = "list"
}

variable "ip_upper_port" {
  description = "security group name"
  type        = "list"
}

variable "ip_range" {
  description = "security group name"
  type        = "list"
}

variable "ip_proto" {
  description = "security rule protocol"
  type        = "list"
}

variable "ip_rules_index" {
  description = "security group name"
  type        = "list"
}

variable "remote_sg_index" {
  description = "index of the remote security group port to open"
  type        = "list"
}

variable "sg_rules_index" {
  description = "security group name"
  type        = "list"
}
