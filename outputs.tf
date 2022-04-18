output "oos_template_id" {
  description = "The id of the oos template."
  value       = concat(alicloud_oos_template.template.*.id, [""])[0]
}

output "oos_parameter_id" {
  description = "The id of the oos parameter."
  value       = concat(alicloud_oos_parameter.parameter.*.id, [""])[0]
}

output "oos_application_id" {
  description = "The id of the oos application."
  value       = concat(alicloud_oos_application.application.*.id, [""])[0]
}