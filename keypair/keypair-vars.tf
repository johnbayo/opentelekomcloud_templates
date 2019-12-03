##############################################
# keypair
##############################################
variable "sshkeyname" {
  description = "name of the ssh key for the ecs instance"
  type        = "list"
}

variable "ssh_pub_key" {
  description = "path of the initial public key to be uploaded"
  type        = "list"
}

variable "sshkey_count" {
  description = "number of public keys to be uploaded"
}
