##############################################
# data disk
##############################################
variable "data_name" {
  description = "the name of the data disk"
  type        = "list"
}

variable "dataindex" {
  description = "the indev value for the data disk to be attached"
  type        = "list"
}

variable "data_instance_index" {
  description = "the index value for the instance"
  type        = "list"
}

variable "data_volume_size" {
  type        = "list"
  description = "data volume size for servers."
}

variable "data_volume_count" {
  type        = "string"
  description = "number of data volume to be created."
}

variable "data_volume_type" {
  type        = "list"
  description = "data volume type for servers. choose from SATA -> common I/O, SAS -> high I/O or SSD -> ultra-high I/O"
}

variable "keyindex" {
  description = "name of the eip"
  type        = "list"
}

