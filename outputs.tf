output "gitlab_metadata" {
  description = "Gitlab metadata"
  value       = data.gitlab_metadata.this
}

#~~~~~~~~~~~~~ Instance ~~~~~~~~~~~~~#

output "instance_variables_id" {
  description = "Gitlab instance variables id"
  value       = module.gitlab_instance.instance_variables_id
}

output "instance_applications" {
  description = "Gitlab instance apps full outcome"
  value       = module.gitlab_instance.applications
  sensitive   = true
}

output "instance_topics" {
  description = "Gitlab topics"
  value       = module.gitlab_instance.topics
  sensitive   = false
}

output "instance_hooks_id" {
  description = "Gitlab system hooks"
  value       = module.gitlab_instance.hooks_id
}

// output "global_level_notifications_id" {
//   description = "Gitlab global level notifications"
//   value = module.gitlab_instance.global_level_notifications_id
// }

#~~~~~~~~~~~~~ Users ~~~~~~~~~~~~~#

output "users_id" {
  description = "Gitlab users id"
  value       = values(module.gitlab_user)[*].id
}

output "users_gpgkeys_id" {
  description = "Gitlab users gpg keys id"
  value       = flatten(values(module.gitlab_user)[*].gpgkeys_id)
}

output "users_gpgkeys_key_id" {
  description = "Gitlab users gpg keys key id"
  value       = flatten(values(module.gitlab_user)[*].gpgkeys_key_id)
}

output "users_sshkeys_key_id" {
  description = "Gitlab users ssh keys key id"
  value       = flatten(values(module.gitlab_user)[*].sshkeys_key_id)
}

output "users_sshkeys_id" {
  description = "Gitlab users ssh keys id"
  value       = flatten(values(module.gitlab_user)[*].sshkeys_id)
}

#~~~~~~~~~~~~~ Groups ~~~~~~~~~~~~~#

output "groups_id" {
  description = "Gitlab groups id"
  value = setunion(
    values(module.gitlab_group)[*].id,
    values(module.gitlab_group_2_tier)[*].id,
    values(module.gitlab_group_3_tier)[*].id
  )
}

output "groups_full_name" {
  description = "Gitlab groups full name"
  value = setunion(
    values(module.gitlab_group)[*].full_name,
    values(module.gitlab_group_2_tier)[*].full_name,
    values(module.gitlab_group_3_tier)[*].full_name
  )
}

output "groups_full_path" {
  description = "Gitlab groups full path"
  value = setunion(
    values(module.gitlab_group)[*].full_path,
    values(module.gitlab_group_2_tier)[*].full_path,
    values(module.gitlab_group_3_tier)[*].full_path
  )
}

output "groups_access_tokens_id" {
  description = "Gitlab groups access tokens id"
  value = setunion(
    values(module.gitlab_group)[*].access_tokens_id,
    values(module.gitlab_group_2_tier)[*].access_tokens_id,
    values(module.gitlab_group_3_tier)[*].access_tokens_id
  )
}

output "groups_custom_attributes" {
  description = "Gitlab groups custom attributes"
  value = setunion(
    values(module.gitlab_group)[*].custom_attributes,
    values(module.gitlab_group_2_tier)[*].custom_attributes,
    values(module.gitlab_group_3_tier)[*].custom_attributes
  )
}

output "groups_epic_boards_id" {
  description = "Gitlab groups epic boards id"
  value = flatten(setunion(
    values(module.gitlab_group)[*].epic_boards_id,
    values(module.gitlab_group_2_tier)[*].epic_boards_id,
    values(module.gitlab_group_3_tier)[*].epic_boards_id
  ))
}

output "groups_issue_boards_id" {
  description = "Gitlab groups issue boards id"
  value = flatten(setunion(
    values(module.gitlab_group)[*].issue_boards_id,
    values(module.gitlab_group_2_tier)[*].issue_boards_id,
    values(module.gitlab_group_3_tier)[*].issue_boards_id
  ))
}

output "groups_ldap_link" {
  description = "Gitlab groups ldap link id"
  value = flatten(setunion(
    values(module.gitlab_group)[*].ldap_link_id,
    values(module.gitlab_group_2_tier)[*].ldap_link_id,
    values(module.gitlab_group_3_tier)[*].ldap_link_id
  ))
}

output "groups_membership_id" {
  description = "Gitlab groups membership id"
  value = flatten(setunion(
    values(module.gitlab_group)[*].membership_id,
    values(module.gitlab_group_2_tier)[*].membership_id,
    values(module.gitlab_group_3_tier)[*].membership_id
  ))
}

output "groups_protected_environments" {
  description = "Gitlab groups protected environments id"
  value = flatten(setunion(
    values(module.gitlab_group)[*].protected_environments,
    values(module.gitlab_group_2_tier)[*].protected_environments,
    values(module.gitlab_group_3_tier)[*].protected_environments
  ))
}

output "groups_saml_link_id" {
  description = "Gitlab groups saml link id"
  value = flatten(setunion(
    values(module.gitlab_group)[*].saml_link_id,
    values(module.gitlab_group_2_tier)[*].saml_link_id,
    values(module.gitlab_group_3_tier)[*].saml_link_id
  ))
}

output "groups_share_group_id" {
  description = "Gitlab groups share group id"
  value = flatten(setunion(
    values(module.gitlab_group)[*].share_groups_id,
    values(module.gitlab_group_2_tier)[*].share_groups_id,
    values(module.gitlab_group_3_tier)[*].share_groups_id
  ))
}

#~~~~~~~~~~~~~ Projects ~~~~~~~~~~~~~#

output "projects" {
  description = "Gitlab projects full object list"
  value = [
    for p in local.projects : module.gitlab_project[p.name]
  ]
  sensitive = true
}

output "projects_id" {
  description = "Gitlab projects id"
  value = [
    for p in local.projects : module.gitlab_project[p.name].id
  ]
}

output "project_integration_custom_issue_tracker" {
  description = "Gitlab project custom integration issue tracker"
  value = [
    for i in flatten(values(module.gitlab_project)[*].integration_custom_issue_tracker) : i
    if i != null
  ]
}


output "project_integration_emails_on_push" {
  description = "Gitlab project custom email on push service"
  value = [
    for i in flatten(values(module.gitlab_project)[*].integration_emails_on_push) : i
    if i != null
  ]
}


output "project_integration_external_wiki" {
  description = "Gitlab project external wiki"
  value = [
    for i in flatten(values(module.gitlab_project)[*].integration_external_wiki) : i
    if i != null
  ]
}


output "project_integration_github" {
  description = "Gitlab project Github intergation"
  value = [
    for i in flatten(values(module.gitlab_project)[*].integration_github) : i
    if i != null
  ]
}

output "project_integration_jira" {
  description = "Gitlab project Jira intergration"
  value       = flatten(values(module.gitlab_project)[*].integration_jira)
  sensitive   = true
}


output "project_integration_mattermost_id" {
  description = "Gitlab project Mattermost integration"
  value = [
    for i in flatten(values(module.gitlab_project)[*].integration_mattermost_id) : i
    if i != null
  ]
}

output "project_integration_microsoft_teams" {
  description = "Gitlab project Microsoft Teams integration"
  value = [
    for i in flatten(values(module.gitlab_project)[*].integration_microsoft_teams) : i
    if i != null
  ]
}

output "project_integration_pipelines_email_id" {
  description = "Gitlab project pipeline email integration"
  value = [
    for i in flatten(values(module.gitlab_project)[*].integration_pipelines_email_id) : i
    if i != null
  ]
}

output "project_integration_slack_id" {
  description = "Gitlab project Slack integration id"
  value = [
    for i in flatten(values(module.gitlab_project)[*].integration_slack_id) : i
    if i != null
  ]
}
