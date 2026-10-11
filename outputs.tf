output "datascience_pipelines_id" {
  description = "Map of id values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no id are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.id if v.id != null && length(v.id) > 0 }
}
output "datascience_pipelines_compartment_id" {
  description = "Map of compartment_id values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no compartment_id are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "datascience_pipelines_configuration_details" {
  description = "Map of configuration_details values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no configuration_details are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => one(v.configuration_details) if v.configuration_details != null && length(v.configuration_details) > 0 }
}
output "datascience_pipelines_created_by" {
  description = "Map of created_by values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no created_by are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.created_by if v.created_by != null && length(v.created_by) > 0 }
}
output "datascience_pipelines_defined_tags" {
  description = "Map of defined_tags values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no defined_tags are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "datascience_pipelines_delete_related_pipeline_runs" {
  description = "Map of delete_related_pipeline_runs values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no delete_related_pipeline_runs are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.delete_related_pipeline_runs if v.delete_related_pipeline_runs != null }
}
output "datascience_pipelines_description" {
  description = "Map of description values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no description are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.description if v.description != null && length(v.description) > 0 }
}
output "datascience_pipelines_display_name" {
  description = "Map of display_name values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no display_name are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "datascience_pipelines_freeform_tags" {
  description = "Map of freeform_tags values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "datascience_pipelines_infrastructure_configuration_details" {
  description = "Map of infrastructure_configuration_details values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no infrastructure_configuration_details are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => one(v.infrastructure_configuration_details) if v.infrastructure_configuration_details != null && length(v.infrastructure_configuration_details) > 0 }
}
output "datascience_pipelines_lifecycle_details" {
  description = "Map of lifecycle_details values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "datascience_pipelines_log_configuration_details" {
  description = "Map of log_configuration_details values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no log_configuration_details are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => one(v.log_configuration_details) if v.log_configuration_details != null && length(v.log_configuration_details) > 0 }
}
output "datascience_pipelines_parameters" {
  description = "Map of parameters values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no parameters are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.parameters if v.parameters != null && length(v.parameters) > 0 }
}
output "datascience_pipelines_project_id" {
  description = "Map of project_id values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no project_id are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}
output "datascience_pipelines_state" {
  description = "Map of state values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no state are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.state if v.state != null && length(v.state) > 0 }
}
output "datascience_pipelines_step_artifact" {
  description = "Map of step_artifact values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no step_artifact are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.step_artifact if v.step_artifact != null && length(v.step_artifact) > 0 }
}
output "datascience_pipelines_step_details" {
  description = "Map of step_details values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no step_details are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.step_details if v.step_details != null && length(v.step_details) > 0 }
}
output "datascience_pipelines_storage_mount_configuration_details_list" {
  description = "Map of storage_mount_configuration_details_list values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no storage_mount_configuration_details_list are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.storage_mount_configuration_details_list if v.storage_mount_configuration_details_list != null && length(v.storage_mount_configuration_details_list) > 0 }
}
output "datascience_pipelines_system_tags" {
  description = "Map of system_tags values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no system_tags are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "datascience_pipelines_time_created" {
  description = "Map of time_created values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no time_created are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "datascience_pipelines_time_updated" {
  description = "Map of time_updated values across all datascience_pipelines, keyed the same as var.datascience_pipelines except keys with no time_updated are omitted"
  value       = { for k, v in oci_datascience_pipeline.datascience_pipelines : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}

