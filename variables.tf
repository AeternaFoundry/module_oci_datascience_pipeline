variable "datascience_pipelines" {
  description = <<EOT
Map of datascience_pipelines, attributes below
Required:
    - compartment_id
    - project_id
    - step_details (block):
        - application_id (optional)
        - depends_on (optional)
        - description (optional)
        - is_artifact_uploaded (optional)
        - job_id (optional)
        - step_configuration_details (optional, block):
            - command_line_arguments (optional)
            - environment_variables (optional)
            - maximum_runtime_in_minutes (optional)
        - step_container_configuration_details (optional, block):
            - cmd (optional)
            - container_type (required)
            - entrypoint (optional)
            - image (required)
            - image_digest (optional)
            - image_signature_id (optional)
        - step_dataflow_configuration_details (optional, block):
            - configuration (optional)
            - driver_shape (optional)
            - driver_shape_config_details (optional, block):
                - memory_in_gbs (optional)
                - memory_in_gbs_parameterized (optional)
                - ocpus (optional)
                - ocpus_parameterized (optional)
            - executor_shape (optional)
            - executor_shape_config_details (optional, block):
                - memory_in_gbs (optional)
                - memory_in_gbs_parameterized (optional)
                - ocpus (optional)
                - ocpus_parameterized (optional)
            - logs_bucket_uri (optional)
            - num_executors (optional)
            - warehouse_bucket_uri (optional)
        - step_infrastructure_configuration_details (optional, block):
            - block_storage_size_in_gbs (required)
            - block_storage_size_in_gbs_parameterized (optional)
            - shape_config_details (optional, block):
                - cpu_baseline (optional)
                - memory_in_gbs (optional)
                - memory_in_gbs_parameterized (optional)
                - ocpus (optional)
                - ocpus_parameterized (optional)
            - shape_name (required)
            - subnet_id (optional)
        - step_name (required)
        - step_parameters (optional, block):
            - output (required, block):
                - output_file (required)
                - output_parameter_type (required)
                - parameter_names (required)
            - parameter_type (required)
        - step_run_name (optional)
        - step_storage_mount_configuration_details_list (optional, block):
            - bucket (optional)
            - destination_directory_name (required)
            - destination_path (optional)
            - export_id (optional)
            - mount_target_id (optional)
            - namespace (optional)
            - prefix (optional)
            - storage_type (required)
        - step_type (required)
Optional:
    - defined_tags
    - delete_related_pipeline_runs
    - description
    - display_name
    - freeform_tags
    - parameters
    - configuration_details (block):
        - command_line_arguments (optional)
        - environment_variables (optional)
        - maximum_runtime_in_minutes (optional)
        - type (required)
    - infrastructure_configuration_details (block):
        - block_storage_size_in_gbs (required)
        - block_storage_size_in_gbs_parameterized (optional)
        - shape_config_details (optional, block):
            - cpu_baseline (optional)
            - memory_in_gbs (optional)
            - memory_in_gbs_parameterized (optional)
            - ocpus (optional)
            - ocpus_parameterized (optional)
        - shape_name (required)
        - subnet_id (optional)
    - log_configuration_details (block):
        - enable_auto_log_creation (optional)
        - enable_logging (optional)
        - log_group_id (optional)
        - log_id (optional)
    - step_artifact (block):
        - artifact_content_disposition (optional)
        - artifact_content_length (optional)
        - pipeline_step_artifact (required)
        - step_name (required)
    - storage_mount_configuration_details_list (block):
        - bucket (optional)
        - destination_directory_name (required)
        - destination_path (optional)
        - export_id (optional)
        - mount_target_id (optional)
        - namespace (optional)
        - prefix (optional)
        - storage_type (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id               = string
    project_id                   = string
    defined_tags                 = optional(map(string))
    delete_related_pipeline_runs = optional(bool)
    description                  = optional(string)
    display_name                 = optional(string)
    freeform_tags                = optional(map(string))
    parameters                   = optional(map(string))
    step_details = list(object({
      application_id       = optional(string)
      depends_on           = optional(list(string))
      description          = optional(string)
      is_artifact_uploaded = optional(bool)
      job_id               = optional(string)
      step_configuration_details = optional(object({
        command_line_arguments     = optional(string)
        environment_variables      = optional(map(string))
        maximum_runtime_in_minutes = optional(string)
      }))
      step_container_configuration_details = optional(object({
        cmd                = optional(list(string))
        container_type     = string
        entrypoint         = optional(list(string))
        image              = string
        image_digest       = optional(string)
        image_signature_id = optional(string)
      }))
      step_dataflow_configuration_details = optional(object({
        configuration = optional(map(string))
        driver_shape  = optional(string)
        driver_shape_config_details = optional(object({
          memory_in_gbs               = optional(number)
          memory_in_gbs_parameterized = optional(string)
          ocpus                       = optional(number)
          ocpus_parameterized         = optional(string)
        }))
        executor_shape = optional(string)
        executor_shape_config_details = optional(object({
          memory_in_gbs               = optional(number)
          memory_in_gbs_parameterized = optional(string)
          ocpus                       = optional(number)
          ocpus_parameterized         = optional(string)
        }))
        logs_bucket_uri      = optional(string)
        num_executors        = optional(number)
        warehouse_bucket_uri = optional(string)
      }))
      step_infrastructure_configuration_details = optional(object({
        block_storage_size_in_gbs               = number
        block_storage_size_in_gbs_parameterized = optional(string)
        shape_config_details = optional(object({
          cpu_baseline                = optional(string)
          memory_in_gbs               = optional(number)
          memory_in_gbs_parameterized = optional(string)
          ocpus                       = optional(number)
          ocpus_parameterized         = optional(string)
        }))
        shape_name = string
        subnet_id  = optional(string)
      }))
      step_name = string
      step_parameters = optional(object({
        output = object({
          output_file           = string
          output_parameter_type = string
          parameter_names       = list(string)
        })
        parameter_type = string
      }))
      step_run_name = optional(string)
      step_storage_mount_configuration_details_list = optional(list(object({
        bucket                     = optional(string)
        destination_directory_name = string
        destination_path           = optional(string)
        export_id                  = optional(string)
        mount_target_id            = optional(string)
        namespace                  = optional(string)
        prefix                     = optional(string)
        storage_type               = string
      })))
      step_type = string
    }))
    configuration_details = optional(object({
      command_line_arguments     = optional(string)
      environment_variables      = optional(map(string))
      maximum_runtime_in_minutes = optional(string)
      type                       = string
    }))
    infrastructure_configuration_details = optional(object({
      block_storage_size_in_gbs               = number
      block_storage_size_in_gbs_parameterized = optional(string)
      shape_config_details = optional(object({
        cpu_baseline                = optional(string)
        memory_in_gbs               = optional(number)
        memory_in_gbs_parameterized = optional(string)
        ocpus                       = optional(number)
        ocpus_parameterized         = optional(string)
      }))
      shape_name = string
      subnet_id  = optional(string)
    }))
    log_configuration_details = optional(object({
      enable_auto_log_creation = optional(bool)
      enable_logging           = optional(bool)
      log_group_id             = optional(string)
      log_id                   = optional(string)
    }))
    step_artifact = optional(list(object({
      artifact_content_disposition = optional(string)
      artifact_content_length      = optional(string)
      pipeline_step_artifact       = string
      step_name                    = string
    })))
    storage_mount_configuration_details_list = optional(list(object({
      bucket                     = optional(string)
      destination_directory_name = string
      destination_path           = optional(string)
      export_id                  = optional(string)
      mount_target_id            = optional(string)
      namespace                  = optional(string)
      prefix                     = optional(string)
      storage_type               = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.datascience_pipelines : (
        length(v.step_details) >= 1
      )
    ])
    error_message = "Each step_details list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_pipelines : (
        alltrue([for item in v.step_details : (contains([for v in ["CONTAINER", "CUSTOM_SCRIPT", "DATAFLOW", "ML_JOB"] : lower(v)], lower(item.step_type)))])
      )
    ])
    error_message = "must be one of: \"CONTAINER\", \"CUSTOM_SCRIPT\", \"DATAFLOW\", \"ML_JOB\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_pipelines : (
        alltrue([for item in v.step_details : (item.step_container_configuration_details == null || (contains([for v in ["OCIR_CONTAINER"] : lower(v)], lower(item.step_container_configuration_details.container_type))))])
      )
    ])
    error_message = "must be one of: \"OCIR_CONTAINER\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_pipelines : (
        alltrue([for item in v.step_details : (item.step_parameters == null || (contains([for v in ["JSON"] : lower(v)], lower(item.step_parameters.output.output_parameter_type))))])
      )
    ])
    error_message = "must be one of: \"JSON\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_pipelines : (
        alltrue([for item in v.step_details : (item.step_parameters == null || (contains([for v in ["DEFAULT"] : lower(v)], lower(item.step_parameters.parameter_type))))])
      )
    ])
    error_message = "must be one of: \"DEFAULT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_pipelines : (
        alltrue([for item in v.step_details : (item.step_storage_mount_configuration_details_list == null || alltrue([for item in item.step_storage_mount_configuration_details_list : (contains([for v in ["FILE_STORAGE", "OBJECT_STORAGE"] : lower(v)], lower(item.storage_type)))]))])
      )
    ])
    error_message = "must be one of: \"FILE_STORAGE\", \"OBJECT_STORAGE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_pipelines : (
        v.configuration_details == null || (contains([for v in ["DEFAULT"] : lower(v)], lower(v.configuration_details.type)))
      )
    ])
    error_message = "must be one of: \"DEFAULT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_pipelines : (
        v.storage_mount_configuration_details_list == null || alltrue([for item in v.storage_mount_configuration_details_list : (contains([for v in ["FILE_STORAGE", "OBJECT_STORAGE"] : lower(v)], lower(item.storage_type)))])
      )
    ])
    error_message = "must be one of: \"FILE_STORAGE\", \"OBJECT_STORAGE\""
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

