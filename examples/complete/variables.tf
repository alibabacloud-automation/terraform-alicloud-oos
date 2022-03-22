variable "version_name" {
  description = "The name of template version."
  type        = string
  default     = "version_name"
}

variable "auto_delete_executions" {
  description = "When deleting a template, whether to delete its related executions. Default to false."
  type        = bool
  default     = false
}

variable "template_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {
    Created = "TF"
    For     = "OosTemplate"
  }
}

variable "parameter_value" {
  description = "The value of the common parameter. The value must be 1 to 4096 characters in length."
  type        = string
  default     = "example_value"
}

variable "parameter_description" {
  description = "The description of the common parameter. The description must be 1 to 200 characters in length."
  type        = string
  default     = "parameter_description"
}

variable "parameter_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {
    Created = "TF"
    For     = "OosParameter"
  }
}

variable "application_name" {
  description = "The name of the application."
  type        = string
  default     = "tf-test"
}

variable "application_description" {
  description = "Application group description information."
  type        = string
  default     = "application_description"
}

variable "application_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {
    Created = "TF"
  }
}
