##############################################
# ecs subnet association
##############################################
variable "ecs_admin_private_ip" {
  description = "the private ip associated with the NIC in the admin subnet"
  type        = "list"
}

variable "admin_index" {
  description = "the instance count.index for the ip association"
  type        = "list"
}

variable "ecs_sg_index" {
  description = "the instance count.index for the ip association"
  type        = "list"
}

variable "nic_state" {
  description = "the instance count.index for the ip association"
}
