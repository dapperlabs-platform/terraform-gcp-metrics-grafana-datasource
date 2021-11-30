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

variable "grafana_datasource_name" {
  description = "(Required) Name for Grafana Datasource - only required when service_account_create is true"
  type        = string
  default     = ""
}

variable "service_account_name" {
  description = "(Required) Name for service account"
  type        = string
  default     = ""
}

variable "grant_folder_permissions" {
  description = "(Optional) Grant metrics permissions to an entire folder"
  type        = bool
  default     = false
}

variable "folder_id" {
  description = "(Optional) ID for the Folder"
  type        = string
  default     = ""
}
