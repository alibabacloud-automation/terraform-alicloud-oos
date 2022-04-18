data "alicloud_resource_manager_resource_groups" "default" {

}

module "oos_template" {
  source = "../.."

  #alicloud_oos_template
  create_template = true

  template_name          = "tf-testacc-template"
  content                = <<EOF
  {
    "FormatVersion":"OOS-2019-06-01",
    "Description":"Describe instances of given status",
    "Parameters":{
        "Status":{
            "Type":"String",
            "Description":"(Required) The status of the Ecs instance."
        }
    },
    "Tasks":[
        {
            "Properties":{
                "Parameters":{
                    "Status":"{{ Status }}"
                },
                "API":"DescribeInstances",
                "Service":"Ecs"
            },
            "Name":"foo",
            "Action":"ACS::ExecuteApi"
        }
    ]
  }
  EOF
  version_name           = var.version_name
  auto_delete_executions = var.auto_delete_executions
  template_tags          = var.template_tags

  #alicloud_oos_parameter
  create_parameter = false

  #alicloud_oos_application
  create_application = false

}

module "oos_parameter" {
  source = "../.."

  #alicloud_oos_template
  create_template = false

  #alicloud_oos_parameter
  create_parameter = true

  parameter_name        = "tf-testacc-parameter"
  parameter_type        = "String"
  parameter_value       = var.parameter_value
  parameter_description = var.parameter_description
  constraints           = <<EOF
  {
    "AllowedValues":["tf-testacc-oos-parameter"],
    "AllowedPattern": "tf-testacc-oos-parameter",
    "MinLength": 1,
    "MaxLength": 100
  }
  EOF
  resource_group_id     = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  parameter_tags        = var.parameter_tags

  #alicloud_oos_application
  create_application = false

}

module "oos_application" {
  source = "../.."

  #alicloud_oos_template
  create_template = false

  #alicloud_oos_parameter
  create_parameter = false

  #alicloud_oos_application
  create_application = true

  application_name        = "tf-testacc-application"
  application_description = var.application_description
  resource_group_id       = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  application_tags        = var.application_tags

}