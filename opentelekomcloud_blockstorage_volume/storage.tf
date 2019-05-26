##################################################################
# Data Volume
##################################################################
resource "opentelekomcloud_blockstorage_volume_v2" "storage_vol" {
  count             = "${var.storage_volume_count}"
  name              = "${element(var.storage_name, count.index % var.storage_volume_count)}-datadisk"
  size              = "${element(var.storage_volume_size, count.index % var.storage_volume_count)}"
  volume_type       = "${element(var.storage_volume_type, count.index % var.storage_volume_count)}"
  availability_zone = "${element(var.az_zone, count.index % var.storage_volume_count)}"

  metadata {
    __system__encrypted = "1"
    __system__cmkid     = "${element(opentelekomcloud_kms_key_v1.resourcekey.*.id, var.keyindex[count.index])}"
  }
}

##################################################################
# Attachment of Compute Volume
##################################################################
resource "opentelekomcloud_compute_volume_attach_v2" "attachments" {
  count       = "${var.storage_volume_count}"
  instance_id = "${element(opentelekomcloud_compute_instance_v2.ec2_instance.*.id, var.storage_index[count.index])}"
  volume_id   = "${element(opentelekomcloud_blockstorage_volume_v2.datavol.*.id, var.storage_index[count.index])}"
}
##############################################
# data disk
##############################################
variable "storage_name" {
  description = "the name of the data disk"
  type        = "list"
}

variable "storage_index" {
  description = "the volume indey due to the count"
  type        = "list"
}

variable "storage_volume_size" {
  type        = "list"
  description = "data volume size for servers."
}

variable "storage_volume_count" {
  type        = "string"
  description = "number of data volume to be created."
}

variable "storage_volume_type" {
  type        = "list"
  description = "data volume type for servers. choose from SATA -> common I/O, SAS -> high I/O or SSD -> ultra-high I/O"
}

variable "keyindex" {
  description = "the index of the kms key used"
  type        = "list"
}

