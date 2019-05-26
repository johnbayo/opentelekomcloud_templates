##############################################
# kms template
##############################################
resource "opentelekomcloud_kms_key_v1" "kms_test" {
  count      = "${var.kms_count}"
  key_alias  = "${element(var.key_alias, count.index % var.kms_count)}"
  realm      = "eu-de"
  is_enabled = true
}

##############################################
# variables
##############################################
variable "kms_count" {
  description = "number of kms key to be deployed"
}

variable "key_alias" {
  description = "name of each kms"
  type        = "list"
}
