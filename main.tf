locals {
  gitlab                       = yamldecode(file("${path.root}/gitlab.yml"))
  gitlab_groups                = local.gitlab["groups"]
  gitlab_users                 = try(local.gitlab["users"], [])
  gitlab_projects              = try(local.gitlab["projects"], [])
  gitlab_compliance_frameworks = try(local.gitlab["compliance_frameworks"], [])

  instance_variables = try(local.gitlab["instance_variables"], [])
  applications       = try(local.gitlab["applications"], [])
  topics             = try(local.gitlab["topics"], [])
  system_hooks       = try(local.gitlab["system_hooks"], [])
  // global_level_notifications = try(local.gitlab["global_level_notifications"], [])
}

data "gitlab_metadata" "this" {}

module "gitlab_instance" {
  source = "github.com/saydulaev/terraform-module-gitlab-instance?ref=bcbac441fddc96945d62b37f7b03a0477ce2388b"

  instance_variables = local.instance_variables
  applications       = local.applications
  topics             = local.topics
  system_hooks       = local.system_hooks
}