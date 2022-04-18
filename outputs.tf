output "id" {
  value = var.grant_folder_permissions ? grafana_data_source.stackdriver_folder.id : grafana_data_source.stackdriver_project.id
}

output "name" {
  value = var.grant_folder_permissions ? grafana_data_source.stackdriver_folder.name : grafana_data_source.stackdriver_project.name
}
