variable "project_name" {
  description = "(Required) Project name where service account will be created."
  type        = string
  default     = ""
}

variable "service_account_create" {
  description = "(Required) Create a new service account"
  type        = bool
  default     = false
}

variable "service_account_email" {
  description = "(Required) Email address for service account"
  type        = string
  default     = ""
}
