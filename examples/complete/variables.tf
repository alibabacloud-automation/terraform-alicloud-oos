#alicloud_oos_template
variable "version_name" {
  description = "The name of template version."
  type        = string
  default     = "tf-testacc-template-version-name"
}

variable "auto_delete_executions" {
  description = "When deleting a template, whether to delete its related executions. Default to false."
  type        = bool
  default     = false
}

variable "template_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default = {
    Name = "TEMPLATE"
  }
}

#alicloud_oos_parameter
variable "parameter_value" {
  description = "The value of the common parameter. The value must be 1 to 4096 characters in length."
  type        = string
  default     = "tf-testacc-oos-parameter"
}

variable "parameter_description" {
  description = "The description of the common parameter. The description must be 1 to 200 characters in length."
  type        = string
  default     = "tf-testacc-parameter-description"
}

variable "parameter_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default = {
    Name = "PARAMETER"
  }
}

#alicloud_oos_application
variable "application_description" {
  description = "Application group description information."
  type        = string
  default     = "tf-testacc-application-description"
}

variable "application_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default = {
    Name = "APPLICATION"
  }
}