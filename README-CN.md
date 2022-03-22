Terraform Module for creating Operation Orchestration Service(OOS) on Alibaba Cloud.

terraform-alicloud-oos
=====================================================================

[English](README.md) | 简体中文

本 Module 用于在阿里云基于 OOS 搭建自动化运维服务，包括模板、参数、应用等。


本 Module 支持创建以下资源:

* [alicloud_oos_template](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/oos_template)
* [alicloud_oos_parameter](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/oos_parameter)
* [alicloud_oos_application](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/oos_application)

## 用法

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

## 示例

* [Clickhouse 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-oos/tree/main/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

## 要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.147.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.147.0 |

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
