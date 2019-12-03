##############################################
# kms
##############################################
variable "kms_count" {
  description = "number of kms to be deployed"
}

variable "resource_key" {
  description = "name of each kms"
  type        = "list"
}
