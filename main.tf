locals {
  gitlab                       = yamldecode(file("${path.root}/gitlab.yml"))
  gitlab_groups                = local.gitlab["groups"]
  gitlab_users                 = try(local.gitlab["users"], [])
  gitlab_projects              = try(local.gitlab["projects"], [])
  gitlab_compliance_frameworks = try(local.gitlab["compliance_frameworks"], [])
}

/*
resource "gitlab_topic" "this" {
  name        = "functional-programming"
  title       = "Functional Programming"
  description = "In computer science, functional programming is a programming paradigm where programs are constructed by applying and composing functions."
  avatar      = "${path.module}/avatar.png"
  avatar_hash = filesha256("${path.module}/avatar.png")
}


resource "gitlab_system_hook" "example" {
  url                      = "https://example.com/hook-%d"
  token                    = "secret-token"
  push_events              = true
  tag_push_events          = true
  merge_requests_events    = true
  repository_update_events = true
  enable_ssl_verification  = true
}
*/

/*
resource "gitlab_compliance_framework" "this" {
  namespace_path                   = "top-level-group"
  name                             = "HIPAA"
  description                      = "A HIPAA Compliance Framework"
  color                            = "#87BEEF"
  default                          = false
  pipeline_configuration_full_path = ".hipaa.yml@top-level-group/compliance-frameworks"
}
*/

data "gitlab_metadata" "this" {}


/*
# Add a project owned by the user
resource "gitlab_project" "sample_project" {
  name = "example"
}

# Add a hook to the project
resource "gitlab_project_hook" "sample_project_hook" {
  project = gitlab_project.sample_project.id
  url     = "https://example.com/project_hook"
}

# Add a variable to the project
resource "gitlab_project_variable" "sample_project_variable" {
  project = gitlab_project.sample_project.id
  key     = "project_variable_key"
  value   = "project_variable_value"
}

# Add a deploy key to the project
resource "gitlab_deploy_key" "sample_deploy_key" {
  project = gitlab_project.sample_project.id
  title   = "terraform example"
  key     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFDthtSuAR22jq9MOd5eN2r20en3PtgS0itS20ExwJ0e Ruslan Saidulaev"
}

# Add a group
resource "gitlab_group" "sample_group" {
  name        = "example"
  path        = "example"
  description = "An example group"
}

# Add a project to the group - example/example
resource "gitlab_project" "sample_group_project" {
  name         = "example"
  namespace_id = gitlab_group.sample_group.id
}
*/