##############################################
# system disk
##############################################
variable "image_name" {
  type        = "list"
  description = "System 'root' volume size for servers."
}

variable "image_count" {
  description = "System 'root' volume size for servers."
}

variable "root_volume_image_count" {
  description = "System 'root' volume size for servers."
}

variable "root_volume_image_id" {
  type        = "list"
  description = "System 'root' volume size for servers."
}

variable "boot_volume_size" {
  type        = "list"
  description = "System 'root' volume size for servers."
}

variable "boot_volume_type" {
  type        = "list"
  description = "System 'root' volume type for servers."
}
