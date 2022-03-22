
resource "alicloud_oos_template" "template" {
  count                  = var.create_template ? 1 : 0
  content                = var.content
  template_name          = var.template_name
  version_name           = var.version_name
  auto_delete_executions = var.auto_delete_executions
  tags                   = var.template_tags
}

resource "alicloud_oos_parameter" "parameter" {
  count             = var.create_parameter ? 1 : 0
  resource_group_id = var.resource_group_id
  parameter_name    = var.parameter_name
  type              = var.parameter_type
  value             = var.parameter_value
  description       = var.parameter_description
  constraints       = var.constraints
  tags              = var.parameter_tags
}

resource "alicloud_oos_application" "application" {
  count             = var.create_application ? 1 : 0
  resource_group_id = var.resource_group_id
  application_name  = var.application_name
  description       = var.application_description
  tags              = var.application_tags 
}
