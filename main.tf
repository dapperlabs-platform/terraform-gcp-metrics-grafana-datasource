terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 1.14.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 3.88.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 3.88.0"
    }
  }
}

// If we're just granting access to a project.
module "project_service_account" {
  count                  = var.grant_folder_permissions ? 0 : 1
  source                 = "github.com/dapperlabs-platform/terraform-google-iam-service-account?ref=v1.1.0"
  project_id             = var.project_name
  name                   = var.service_account_name
  generate_key           = var.service_account_create // Don't generate a key if we aren't creating a service account.
  service_account_create = var.service_account_create // Are we actually creating a service account?
  iam_project_roles = {
    "${var.project_name}" = [
      "roles/monitoring.viewer",
    ]
  }
}

// If we're granting access to an entire folder.
module "folder_service_account" {
  count                  = var.grant_folder_permissions ? 1 : 0
  source                 = "github.com/dapperlabs-platform/terraform-google-iam-service-account?ref=v1.1.0"
  project_id             = var.project_name
  name                   = var.service_account_name
  generate_key           = var.service_account_create // Don't generate a key if we aren't creating a service account.
  service_account_create = var.service_account_create // Are we actually creating a service account?
  iam_folder_roles = {
    "${var.folder_id}" = [
      "roles/monitoring.viewer",
    ]
  }
}

// If we're just granting access to a project AND creating the service account.
resource "grafana_data_source" "stackdriver_project" {
  count = var.service_account_create && !var.grant_folder_permissions ? 1 : 0
  depends_on = [
    module.project_service_account
  ]
  type = "stackdriver"
  name = "${var.project_name}-gcp-metrics"

  json_data {
    token_uri           = "https://oauth2.googleapis.com/token"
    authentication_type = "jwt"
    default_project     = var.project_name
    client_email        = module.project_service_account[0].iam_email
  }

  secure_json_data {
    private_key = module.project_service_account[0].key.private_key
  }
}

// If we're just granting access to a folder AND creating the service account.
resource "grafana_data_source" "stackdriver_folder" {
  count = var.service_account_create && var.grant_folder_permissions ? 1 : 0
  depends_on = [
    module.folder_service_account
  ]
  type = "stackdriver"
  name = "${var.project_name}-gcp-metrics"

  json_data {
    token_uri           = "https://oauth2.googleapis.com/token"
    authentication_type = "jwt"
    default_project     = var.project_name
    client_email        = module.folder_service_account[0].iam_email
  }

  secure_json_data {
    private_key = module.folder_service_account[0].key.private_key
  }
}
