resource "opentelekomcloud_sfs_file_system_v2" "sfs_test" {
  count        = "${var.sfs_count}"
  size         = "${element(var.sfs_size, count.index % var.sfs_count)}"
  name         = "${element(var.sfs_name, count.index % var.sfs_count)}"
  access_to    = "${format("${opentelekomcloud_vpc_v1.vpc_test.id}%s#0#no_all_squash,no_root_squash", "#${element(var.sfs_ip_range, count.index % var.sfs_count)}")}" 
  access_level = "${element(var.sfs_access_level, count.index % var.sfs_count)}"

  metadata = {
    "type"                 = "nfs"
    "#sfs_crypt_domain_id" = "${var.domain_name}"
    "#sfs_crypt_alias"     = "${element(var.resource_key, var.sfs_keyindex[count.index])}"
    "#sfs_crypt_key_id"    = "${element(opentelekomcloud_kms_key_v1.resourcekey.*.id, var.sfs_keyindex[count.index])}"
  }

  lifecycle = {
    ignore_changes = ["availability_zone", "metadata"]
  }

  depends_on = ["opentelekomcloud_vpc_v1.vpc_test"]
}
##############################################
# SFS
##############################################
variable "sfs_name" {
  description = "name of the sfs device"
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
