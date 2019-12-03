##############################################
# SFS
##############################################
variable "sfs_name" {
  description = "name of the sfs device"
  type        = "list"
}

variable "sfs_az" {
  description = "the availability zone of the sfs device"
  type        = "list"
}

variable "sfs_count" {
  description = "the number of sfs to be created"
}

variable "sfs_size" {
  description = "the size of the nfs"
  type        = "list"
}

variable "sfs_ip_range" {
  description = "allowed access to ip addresses"
  type        = "list"
}

variable "sfs_access_level" {
  description = "the access the nfs requires"
  type        = "list"
}

variable "sfs_keyindex" {
  description = "the key index parameter to secure the nfs"
  type        = "list"
}
