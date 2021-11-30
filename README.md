# terraform-gcp-metrics-grafana-datasource

This module creates a Grafana Datasource from a Google Cloud Service Account key.

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
| <a name="module_service_account"></a> [service\_account](#module\_service\_account) | github.com/dapperlabs-platform/terraform-google-iam-service-account | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [grafana_data_source.stackdriver](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/data_source) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name where service account will be created. | `string` | n/a | yes |

## Outputs

No outputs.
