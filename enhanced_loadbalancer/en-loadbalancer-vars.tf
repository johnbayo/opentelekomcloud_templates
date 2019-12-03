##############################################
# Loadbalancer 
##############################################
variable "lb_name" {
  description = " Count of the eips"
}

variable "lbnetz_index" {
  description = "The Name of the bandwidth"
}

variable "listener_count" {
  description = "The Name of the bandwidth"
}

variable "listener_name" {
  description = "The Name of the bandwidth"
  type        = "list"
}

variable "listener_protocol" {
  description = "The Name of the bandwidth"
  type        = "list"
}

variable "listener_port" {
  description = "The Name of the bandwidth"
  type        = "list"
}

variable "cert_id" {
  description = "The Name of the bandwidth"
  type        = "list"
}

variable "cert_index" {
  description = "The Name of the bandwidth"
  type        = "list"
}

variable "pool_count" {
  description = "The Number of pools to be created"
}

variable "pool_name" {
  description = "The Name of the bandwidth"
  type        = "list"
}

variable "pool_protocol" {
  description = "The Name of the bandwidth"
  type        = "list"
}

variable "pool_index" {
  description = "The Name of the bandwidth"
  type        = "list"
}

variable "health_type" {
  description = "The Name of the bandwidth"
  type        = "list"
}

variable "server_port" {
  description = "The Name of the bandwidth"
  type        = "list"
}

variable "member_count" {
  description = "The Name of the bandwidth"
}

variable "member_subnet_index" {
  type = "list"
}

variable "server_address" {
  description = "The Name of the bandwidth"
  type        = "list"
}

variable "member_index" {
  description = "The Name of the bandwidth"
  type        = "list"
}

variable "health_index" {
  description = "the index number of the pool for the health check"
  type        = "list"
}
