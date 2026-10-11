resource "oci_datascience_pipeline" "datascience_pipelines" {
  for_each = var.datascience_pipelines

  compartment_id               = each.value.compartment_id
  project_id                   = each.value.project_id
  defined_tags                 = each.value.defined_tags
  delete_related_pipeline_runs = each.value.delete_related_pipeline_runs
  description                  = each.value.description
  display_name                 = each.value.display_name
  freeform_tags                = each.value.freeform_tags
  parameters                   = each.value.parameters

  dynamic "step_details" {
    for_each = each.value.step_details
    content {
      application_id       = step_details.value.application_id
      depends_on           = step_details.value.depends_on
      description          = step_details.value.description
      is_artifact_uploaded = step_details.value.is_artifact_uploaded
      job_id               = step_details.value.job_id
      dynamic "step_configuration_details" {
        for_each = step_details.value.step_configuration_details != null ? [step_details.value.step_configuration_details] : []
        content {
          command_line_arguments     = step_configuration_details.value.command_line_arguments
          environment_variables      = step_configuration_details.value.environment_variables
          maximum_runtime_in_minutes = step_configuration_details.value.maximum_runtime_in_minutes
        }
      }
      dynamic "step_container_configuration_details" {
        for_each = step_details.value.step_container_configuration_details != null ? [step_details.value.step_container_configuration_details] : []
        content {
          cmd                = step_container_configuration_details.value.cmd
          container_type     = step_container_configuration_details.value.container_type
          entrypoint         = step_container_configuration_details.value.entrypoint
          image              = step_container_configuration_details.value.image
          image_digest       = step_container_configuration_details.value.image_digest
          image_signature_id = step_container_configuration_details.value.image_signature_id
        }
      }
      dynamic "step_dataflow_configuration_details" {
        for_each = step_details.value.step_dataflow_configuration_details != null ? [step_details.value.step_dataflow_configuration_details] : []
        content {
          configuration = step_dataflow_configuration_details.value.configuration
          driver_shape  = step_dataflow_configuration_details.value.driver_shape
          dynamic "driver_shape_config_details" {
            for_each = step_dataflow_configuration_details.value.driver_shape_config_details != null ? [step_dataflow_configuration_details.value.driver_shape_config_details] : []
            content {
              memory_in_gbs               = driver_shape_config_details.value.memory_in_gbs
              memory_in_gbs_parameterized = driver_shape_config_details.value.memory_in_gbs_parameterized
              ocpus                       = driver_shape_config_details.value.ocpus
              ocpus_parameterized         = driver_shape_config_details.value.ocpus_parameterized
            }
          }
          executor_shape = step_dataflow_configuration_details.value.executor_shape
          dynamic "executor_shape_config_details" {
            for_each = step_dataflow_configuration_details.value.executor_shape_config_details != null ? [step_dataflow_configuration_details.value.executor_shape_config_details] : []
            content {
              memory_in_gbs               = executor_shape_config_details.value.memory_in_gbs
              memory_in_gbs_parameterized = executor_shape_config_details.value.memory_in_gbs_parameterized
              ocpus                       = executor_shape_config_details.value.ocpus
              ocpus_parameterized         = executor_shape_config_details.value.ocpus_parameterized
            }
          }
          logs_bucket_uri      = step_dataflow_configuration_details.value.logs_bucket_uri
          num_executors        = step_dataflow_configuration_details.value.num_executors
          warehouse_bucket_uri = step_dataflow_configuration_details.value.warehouse_bucket_uri
        }
      }
      dynamic "step_infrastructure_configuration_details" {
        for_each = step_details.value.step_infrastructure_configuration_details != null ? [step_details.value.step_infrastructure_configuration_details] : []
        content {
          block_storage_size_in_gbs               = step_infrastructure_configuration_details.value.block_storage_size_in_gbs
          block_storage_size_in_gbs_parameterized = step_infrastructure_configuration_details.value.block_storage_size_in_gbs_parameterized
          dynamic "shape_config_details" {
            for_each = step_infrastructure_configuration_details.value.shape_config_details != null ? [step_infrastructure_configuration_details.value.shape_config_details] : []
            content {
              cpu_baseline                = shape_config_details.value.cpu_baseline
              memory_in_gbs               = shape_config_details.value.memory_in_gbs
              memory_in_gbs_parameterized = shape_config_details.value.memory_in_gbs_parameterized
              ocpus                       = shape_config_details.value.ocpus
              ocpus_parameterized         = shape_config_details.value.ocpus_parameterized
            }
          }
          shape_name = step_infrastructure_configuration_details.value.shape_name
          subnet_id  = step_infrastructure_configuration_details.value.subnet_id
        }
      }
      step_name = step_details.value.step_name
      dynamic "step_parameters" {
        for_each = step_details.value.step_parameters != null ? [step_details.value.step_parameters] : []
        content {
          output {
            output_file           = step_parameters.value.output.output_file
            output_parameter_type = step_parameters.value.output.output_parameter_type
            parameter_names       = step_parameters.value.output.parameter_names
          }
          parameter_type = step_parameters.value.parameter_type
        }
      }
      step_run_name = step_details.value.step_run_name
      dynamic "step_storage_mount_configuration_details_list" {
        for_each = step_details.value.step_storage_mount_configuration_details_list != null ? step_details.value.step_storage_mount_configuration_details_list : []
        content {
          bucket                     = step_storage_mount_configuration_details_list.value.bucket
          destination_directory_name = step_storage_mount_configuration_details_list.value.destination_directory_name
          destination_path           = step_storage_mount_configuration_details_list.value.destination_path
          export_id                  = step_storage_mount_configuration_details_list.value.export_id
          mount_target_id            = step_storage_mount_configuration_details_list.value.mount_target_id
          namespace                  = step_storage_mount_configuration_details_list.value.namespace
          prefix                     = step_storage_mount_configuration_details_list.value.prefix
          storage_type               = step_storage_mount_configuration_details_list.value.storage_type
        }
      }
      step_type = step_details.value.step_type
    }
  }

  dynamic "configuration_details" {
    for_each = each.value.configuration_details != null ? [each.value.configuration_details] : []
    content {
      command_line_arguments     = configuration_details.value.command_line_arguments
      environment_variables      = configuration_details.value.environment_variables
      maximum_runtime_in_minutes = configuration_details.value.maximum_runtime_in_minutes
      type                       = configuration_details.value.type
    }
  }

  dynamic "infrastructure_configuration_details" {
    for_each = each.value.infrastructure_configuration_details != null ? [each.value.infrastructure_configuration_details] : []
    content {
      block_storage_size_in_gbs               = infrastructure_configuration_details.value.block_storage_size_in_gbs
      block_storage_size_in_gbs_parameterized = infrastructure_configuration_details.value.block_storage_size_in_gbs_parameterized
      dynamic "shape_config_details" {
        for_each = infrastructure_configuration_details.value.shape_config_details != null ? [infrastructure_configuration_details.value.shape_config_details] : []
        content {
          cpu_baseline                = shape_config_details.value.cpu_baseline
          memory_in_gbs               = shape_config_details.value.memory_in_gbs
          memory_in_gbs_parameterized = shape_config_details.value.memory_in_gbs_parameterized
          ocpus                       = shape_config_details.value.ocpus
          ocpus_parameterized         = shape_config_details.value.ocpus_parameterized
        }
      }
      shape_name = infrastructure_configuration_details.value.shape_name
      subnet_id  = infrastructure_configuration_details.value.subnet_id
    }
  }

  dynamic "log_configuration_details" {
    for_each = each.value.log_configuration_details != null ? [each.value.log_configuration_details] : []
    content {
      enable_auto_log_creation = log_configuration_details.value.enable_auto_log_creation
      enable_logging           = log_configuration_details.value.enable_logging
      log_group_id             = log_configuration_details.value.log_group_id
      log_id                   = log_configuration_details.value.log_id
    }
  }

  dynamic "step_artifact" {
    for_each = each.value.step_artifact != null ? each.value.step_artifact : []
    content {
      artifact_content_disposition = step_artifact.value.artifact_content_disposition
      artifact_content_length      = step_artifact.value.artifact_content_length
      pipeline_step_artifact       = step_artifact.value.pipeline_step_artifact
      step_name                    = step_artifact.value.step_name
    }
  }

  dynamic "storage_mount_configuration_details_list" {
    for_each = each.value.storage_mount_configuration_details_list != null ? each.value.storage_mount_configuration_details_list : []
    content {
      bucket                     = storage_mount_configuration_details_list.value.bucket
      destination_directory_name = storage_mount_configuration_details_list.value.destination_directory_name
      destination_path           = storage_mount_configuration_details_list.value.destination_path
      export_id                  = storage_mount_configuration_details_list.value.export_id
      mount_target_id            = storage_mount_configuration_details_list.value.mount_target_id
      namespace                  = storage_mount_configuration_details_list.value.namespace
      prefix                     = storage_mount_configuration_details_list.value.prefix
      storage_type               = storage_mount_configuration_details_list.value.storage_type
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

