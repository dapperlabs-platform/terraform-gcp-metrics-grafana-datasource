# terraform-gcp-metrics-grafana-datasource

This module creates a Grafana Datasource from a Google Cloud Service Account key.

If creating a new Service Account:

```hcl
module "gcp-metrics-grafana-datasource" {
  source                  = "github.com/dapperlabs-platform/terraform-gcp-metrics-grafana-datasource?ref=tag"
  project_name            = "project-name-goes-here"
  service_account_create  = true
  service_account_name    = "new-metrics-reader"
  grafana_datasource_name = "Datasource Name"
}
```

If using an existing Service Account:

```hcl
module "gcp-metrics-grafana-datasource" {
  source                 = "github.com/dapperlabs-platform/terraform-gcp-metrics-grafana-datasource?ref=tag"
  project_name           = "project-name-goes-here"
  service_account_create = false
  service_account_name   = "metrics-reader"
}
```

If granting access to an entire GCP folder - with an existing service account from a specific project:

```hcl
module "gcp-metrics-grafana-datasource" {
  source                   = "github.com/dapperlabs-platform/terraform-gcp-metrics-grafana-datasource?ref=tag"
  project_name             = "project-name-goes-here"
  service_account_create   = false
  service_account_name     = "metrics-reader"
  grant_folder_permissions = true
  folder_id                = "folders/1234567788888"
}
```

If granting access to an entire GCP folder - with an new service account created in a specific project:

```hcl
module "gcp-metrics-grafana-datasource" {
  source                   = "github.com/dapperlabs-platform/terraform-gcp-metrics-grafana-datasource?ref=tag"
  project_name             = "project-name-goes-here"
  service_account_create   = true
  service_account_name     = "metrics-reader"
  grant_folder_permissions = true
  folder_id                = "folders/1234567788888"
  grafana_datasource_name  = "Datasource Name"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.88.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 3.88.0 |
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | >= 1.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | 1.16.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_folder_service_account"></a> [folder\_service\_account](#module\_folder\_service\_account) | github.com/dapperlabs-platform/terraform-google-iam-service-account | v1.1.0 |
| <a name="module_project_service_account"></a> [project\_service\_account](#module\_project\_service\_account) | github.com/dapperlabs-platform/terraform-google-iam-service-account | v1.1.0 |

## Resources

| Name | Type |
|------|------|
| [grafana_data_source.stackdriver_folder](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/data_source) | resource |
| [grafana_data_source.stackdriver_project](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/data_source) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | (Optional) ID for the Folder | `string` | `""` | no |
| <a name="input_grafana_datasource_name"></a> [grafana\_datasource\_name](#input\_grafana\_datasource\_name) | (Required) Name for Grafana Datasource - only required when service\_account\_create is true | `string` | `""` | no |
| <a name="input_grant_folder_permissions"></a> [grant\_folder\_permissions](#input\_grant\_folder\_permissions) | (Optional) Grant metrics permissions to an entire folder | `bool` | `false` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | (Required) Project name where service account will be created. | `string` | `""` | no |
| <a name="input_service_account_create"></a> [service\_account\_create](#input\_service\_account\_create) | (Required) Create a new service account | `bool` | `false` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | (Required) Name for service account | `string` | `""` | no |

## Outputs

No outputs.
