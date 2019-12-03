##############################################
# Container Cluster
##############################################
variable "cluster_name" {
  description = "name of the cluster engine"
  type        = "list"
}

variable "clusterindex" {
  description = "name of the cluster engine"
  type        = "list"
}

variable "cluster_count" {
  description = "the number of cluster engine to be created"
}

variable "cluster_flavor" {
  description = "the flavor image to be used for each cluster engine"
  type        = "list"
}

variable "cluster_version" {
  description = "the version of cluster to be installed"
  type        = "list"
}

variable "cluster_subnet_index" {
  description = "default subnet index the cluster engine should be attached to"
  type        = "list"
}

variable "cluster_con_netz_typ" {
  description = "the cluster network type tunnel or vpc"
  type        = "list"
}
