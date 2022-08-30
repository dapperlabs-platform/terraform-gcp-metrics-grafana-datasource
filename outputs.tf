output "datasource_name" {
  value = var.service_account_create && var.grant_folder_permissions ? grafana_data_source.stackdriver_folder[0].name : grafana_data_source.stackdriver_project[0].name
}

output "datasource_uid" {
  value = var.service_account_create && var.grant_folder_permissions ? grafana_data_source.stackdriver_folder[0].uid : grafana_data_source.stackdriver_project[0].uid
}