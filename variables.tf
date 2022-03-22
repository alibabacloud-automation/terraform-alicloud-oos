
variable "resource_group_id" {
  description = "The ID of the resource group."
  type        = string
  default     = ""
}

#alicloud_oos_template
variable "create_template" {
  description = "Controls if oos template should be created"
  type        = bool
  default     = false
}

variable "template_name" {
  description = "The name of the template."
  type        = string
  default     = ""
}

variable "content" {
  description = "The content of the template. The template must be in the JSON or YAML format. Maximum size: 64 KB."
  type        = string
  default     = ""
}

variable "version_name" {
  description = "The name of template version."
  type        = string
  default     = ""
}

variable "auto_delete_executions" {
  description = "When deleting a template, whether to delete its related executions. Default to false."
  type        = bool
  default     = false
}

variable "template_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
#alicloud_oos_parameter
variable "create_parameter" {
  description = "Controls if oos parameter should be created"
  type        = bool
  default     = false
}

variable "parameter_name" {
  description = "The name of the common parameter."
  type        = string
  default     = ""
}

variable "parameter_type" {
  description = "The data type of the common parameter. Valid values: String and StringList."
  type        = string
  default     = "String"
}

variable "parameter_value" {
  description = "The value of the common parameter. The value must be 1 to 4096 characters in length."
  type        = string
  default     = ""
}

variable "parameter_description" {
  description = "The description of the common parameter. The description must be 1 to 200 characters in length."
  type        = string
  default     = ""
}

variable "constraints" {
  description = "The constraints of the common parameter. "
  type        = string
  default     = null
}

variable "parameter_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
#alicloud_oos_application
variable "create_application" {
  description = "Controls if oos application should be created"
  type        = bool
  default     = false
}

variable "application_name" {
  description = "The name of the application."
  type        = string
  default     = ""
}

variable "application_description" {
  description = "Application group description information."
  type        = string
  default     = ""
}

variable "application_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

