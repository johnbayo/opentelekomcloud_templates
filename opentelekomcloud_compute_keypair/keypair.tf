##############################################
# ssh keys Template 
##############################################
resource "opentelekomcloud_compute_keypair_v2" "keypair_test" {
  count      = "${var.sshkey_count}"
  name       = "${element(var.sshkeyname, count.index % var.sshkey_count)}"
  public_key = "${file(element(var.ssh_pub_key, count.index % var.sshkey_count))}"
}
##############################################
# keypair
##############################################
variable "sshkeyname" {
  description = "name of the ssh key for the ecs instance or node clusters"
  type        = "list"
}

variable "ssh_pub_key" {
  description = "path of the initial public key to be uploaded"
  type        = "list"
}

variable "sshkey_count" {
  description = "number of public keys to be uploaded"
}
