##############################################
# BACKUP    
##############################################
variable "retention_days" {
  description = "backup retention days"
}

variable "node_server_id" {
  description = "id of the node clusters"
  type        = "list"
}

