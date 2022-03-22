provider "alicloud" {
  region = "cn-hangzhou"
}

resource "alicloud_resource_manager_resource_group" "resource_group" {
  resource_group_name = "testoos"
  display_name        = "testoos"
}

module "example" {
  source                  = "../.."
  resource_group_id       = alicloud_resource_manager_resource_group.resource_group.id
  #alicloud_oos_template
  create_template         = true
  template_name           = "tf-test"
  version_name            = var.version_name
  auto_delete_executions  = var.auto_delete_executions
  template_tags           = var.template_tags
  #alicloud_oos_parameter
  create_parameter        = true
  parameter_name          = "tf-test"
  parameter_type          = "String"
  parameter_value         = var.parameter_value
  parameter_description   = var.parameter_description
  constraints             = null
  parameter_tags          = var.parameter_tags
  #alicloud_oos_application
  create_application      = true
  application_name        = var.application_name
  application_description = var.application_description
  application_tags        = var.application_tags
  content                 = <<EOF
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

}