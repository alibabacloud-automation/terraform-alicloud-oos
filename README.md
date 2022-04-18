Terraform Module for creating Operation Orchestration Service(OOS) on Alibaba Cloud.

terraform-alicloud-oos
=====================================================================

English | [简体中文](README-CN.md)

This module is used to create a Operation Orchestration Service(OOS) under Alibaba Cloud.

These types of resources are supported:

* [alicloud_oos_template](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/oos_template)
* [alicloud_oos_parameter](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/oos_parameter)
* [alicloud_oos_application](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/oos_application)

## Usage

```hcl
module "example" {
  source                  = "terraform-alicloud-modules/oos/alicloud"
  resource_group_id       = "rg-123456xxx"
  #alicloud_oos_template
  create_template         = true
  template_name           = "tf-test"
  version_name            = "version_name"
  auto_delete_executions  = false
  #alicloud_oos_parameter
  create_parameter        = true
  parameter_name          = "tf-test"
  parameter_type          = "String"
  parameter_value         = "example_value"
  parameter_description   = "parameter_description"
  constraints             = null
  #alicloud_oos_application
  create_application      = true
  application_name        = "tf-test"
  application_description = "application_description"
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
```

## Examples

* [complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-oos/tree/main/examples/complete)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`. If you have not set them
  yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.147.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.147.0 |

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)