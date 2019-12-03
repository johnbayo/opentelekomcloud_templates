##############################################
# Node Cluster
##############################################
variable "node_name" {
  description = "name of the nodes in the cluster"
  type        = "list"
}

variable "node_count" {
  description = "name of nodes to be created in each cluster engine"
}

variable "node_flavor" {
  description = "the flavor of each nodes"
  type        = "list"
}

variable "node_az" {
  description = "the node availability zone"
  type        = "list"
}

variable "node_root_vol_size" {
  description = "the size of the root volume"
  type        = "list"
}

variable "node_root_vol_typ" {
  description = "the type of the root volume"
  type        = "list"
}

variable "node_data_vol_size" {
  description = "the size of the data volume"
  type        = "list"
}

variable "node_data_vol_typ" {
  description = "the type of data volume"
  type        = "list"
}
