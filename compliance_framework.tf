
resource "gitlab_compliance_framework" "this" {
  for_each = contains(["premium", "ultimate"], lower(var.tier)) ? {
    for cf in local.gitlab_compliance_frameworks : cf.name => cf
  } : {}

  namespace_path                   = local.exists_groups[each.value.namespace_path].group_id
  name                             = each.value.name
  description                      = try(each.value.description, null)
  color                            = each.value.color
  default                          = try(each.value.default, null)
  pipeline_configuration_full_path = try(each.value.pipeline_configuration_full_path, null)

  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}
