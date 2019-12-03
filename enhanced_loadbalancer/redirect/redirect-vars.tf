##############################################
# Redirect
##############################################
variable "redirect_count" {
  description = "number of redirects to be created"
}

variable "redirect_api_version" {
  description = "the current api versiom"
  default = "v2.0"
}

variable "redirect_json_file_name" {
  description = "the redirect content"
  default = "redirect.json"
}

variable "redirect_resource_type" {
  description = "the type of loadbalancer to be redirected"
  default = "elb"
}

variable "redirect_resource_url" {
  description = "the resource url of the loadbalancer type"
  default = "lbaas/l7policies"
}

variable "http_index" {
  description = "the http port of the redirect"
  type        = "list"
}

variable "https_index" {
  description = "the https port of the redirect"
  type        = "list"
}
