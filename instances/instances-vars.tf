##############################################
# ECS Instance    
##############################################
variable "ecs_name" {
  description = "name of the ecs instance"
  type        = "list"
}

variable "az_zone" {
  description = "name of the ecs instance"
  type        = "list"
}

variable "ecs_flavor_name" {
  description = "kind of machine to deploy"
  type        = "list"
}

variable "user_data_path" {
  description = "path of the user data configuration to be deployed on the instance"
  type        = "list"
}

variable "ecs_instance_count" {
  description = "number of ecs instance to be deployed"
}
