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

module "service_account" {
  source                 = "github.com/dapperlabs-platform/terraform-google-iam-service-account?ref=v1.0.0"
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

resource "grafana_data_source" "stackdriver" {
  count = var.service_account_create ? 1 : 0
  depends_on = [
    module.service_account
  ]
  type = "stackdriver"
  name = "${var.project_name}-gcp-metrics"

  json_data {
    token_uri           = "https://oauth2.googleapis.com/token"
    authentication_type = "jwt"
    default_project     = var.project_name
    client_email        = module.service_account.iam_email
  }

  secure_json_data {
    private_key = module.service_account.key.private_key
  }
}
