##############################################
# default ssh schlüssel
##############################################
resource "opentelekomcloud_compute_keypair_v2" "keypair" {
  count      = "${var.sshkey_count}"
  name       = "${element(var.sshkeyname, count.index % var.sshkey_count)}"
  public_key = "${file(element(var.ssh_pub_key, count.index % var.sshkey_count))}"
}
