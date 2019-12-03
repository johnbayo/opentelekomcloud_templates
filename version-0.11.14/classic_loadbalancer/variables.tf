##############################################
# classic loadbalancer
##############################################
variable "lb_name" {
  description = "name Loadbalancer"
}

variable "lb_bandwidth" {
  description = "name Loadbalancer"
}

variable "eip_index" {
  description = "name Loadbalancer"
}

variable "listener_count" {}

variable "listener_name" {
  type        = "list"
}

variable "listener_protocol" {
  type        = "list"
}

variable "listener_port" {
  type        = "list"
}

variable "backend_protocol" {
  type        = "list"
}

variable "backend_port" {
  type        = "list"
}

variable "cert_id" {
  type        = "list"
} 

variable "cert_index" {
  type        = "list"
}

variable "backend_count" {
}

variable "server_address" {
  type        = "list"
}

variable "backend_index" {
  type        = "list"
}

variable "health_protocol" {
  type        = "list"
}

variable "health_port" {
  type        = "list"
}
