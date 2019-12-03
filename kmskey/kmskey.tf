resource "opentelekomcloud_kms_key_v1" "resourcekey" {
  count      = "${var.kms_count}"
  key_alias  = "${element(var.resource_key, count.index % var.kms_count)}"
  realm      = "eu-de"
  is_enabled = true
}
