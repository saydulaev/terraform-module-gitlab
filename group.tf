locals {
  groups = { for group in keys(local.gitlab_groups) : group =>
    merge(
      {
        name                               = try(local.gitlab_groups[group].name, group)
        path                               = try(local.gitlab_groups[group].path, group)
        auto_devops_enabled                = try(local.gitlab_groups[group].auto_devops_enabled, null)
        avatar                             = try(local.gitlab_groups[group].avatar, null)
        avatar_hash                        = try(local.gitlab_groups[group].avatar_hash, null)
        default_branch_protection          = try(local.gitlab_groups[group].default_branch_protection, 4)
        description                        = try(local.gitlab_groups[group].description, group)
        emails_enabled                     = try(local.gitlab_groups[group].emails_enabled, null)
        extra_shared_runners_minutes_limit = try(local.gitlab_groups[group].extra_shared_runners_minutes_limit, null)
        ip_restriction_ranges              = try(local.gitlab_groups[group].ip_restriction_ranges, null)
        lfs_enabled                        = try(local.gitlab_groups[group].lfs_enabled, null)
        membership_lock                    = try(local.gitlab_groups[group].membership_lock, null)
        mentions_disabled                  = try(local.gitlab_groups[group].mentions_disabled, null)
        parent_id                          = try(local.gitlab_groups[group].parent_id, null)
        prevent_forking_outside_group      = try(local.gitlab_groups[group].prevent_forking_outside_group, null)
        project_creation_level             = try(local.gitlab_groups[group].project_creation_level, null)
        push_rules                         = try(local.gitlab_groups[group].push_rules, {})
        request_access_enabled             = try(local.gitlab_groups[group].request_access_enabled, null)
        require_two_factor_authentication  = try(local.gitlab_groups[group].require_two_factor_authentication, null)
        share_with_group_lock              = try(local.gitlab_groups[group].share_with_group_lock, null)
        shared_runners_minutes_limit       = try(local.gitlab_groups[group].shared_runners_minutes_limit, null)
        shared_runners_setting             = try(local.gitlab_groups[group].shared_runners_setting, null)
        subgroup_creation_level            = try(local.gitlab_groups[group].subgroup_creation_level, null)
        two_factor_grace_period            = try(local.gitlab_groups[group].two_factor_grace_period, null)
        visibility_level                   = try(local.gitlab_groups[group].visibility_level, null)
        wiki_access_level                  = try(local.gitlab_groups[group].wiki_access_level, null)
        access_tokens = length(try(local.gitlab_groups[group].access_tokens, [])) > 0 ? [
          for token in local.gitlab_groups[group].access_tokens : merge({
            name         = token.name
            group        = try(local.gitlab_groups[group].name, group)
            scopes       = can(tolist(token.scopes)) ? token.scopes : []
            access_level = token.access_level
            expires_at   = token.expires_at
            rotation_configuration = try(token.rotation_configuration, null) != null ? {
              expiration_days    = try(token.rotation_configuration.expiration_days, null)
              rotate_before_days = try(token.rotation_configuration.rotate_before_days, null)
            } : null
          })
        ] : []
        badges = length(try(local.gitlab_groups[group].badges, [])) > 0 ? [
          for badge in local.gitlab_groups[group].badges : merge({
            group     = try(local.gitlab_groups[group].name, group)
            link_url  = badge.link_url
            image_url = badge.image_url
            name      = try(badge.name, null)
          })
        ] : []
        custom_attributes = length(try(local.gitlab_groups[group].custom_attributes, [])) > 0 ? [
          for attr in local.gitlab_groups[group].custom_attributes : merge({
            group     = try(local.gitlab_groups[group].name, group)
            key       = attr.key
            value     = try(attr.value, "")
            parent_id = try(local.gitlab_groups[group].parent_id, null)
          })
        ] : []
        labels = length(try(local.gitlab_groups[group].labels, [])) > 0 ? [
          for label in local.gitlab_groups[group].labels : merge({
            group       = try(local.gitlab_groups[group].name, group)
            name        = label.name
            description = try(label.description, null)
            color       = label.color
          })
        ] : []
        epic_boards = length(try(local.gitlab_groups[group].epic_boards, [])) > 0 ? [
          for board in local.gitlab_groups[group].epic_boards : merge({
            group     = try(local.gitlab_groups[group].name, group)
            name      = board.name
            lists     = try(board.lists, [])
            parent_id = try(local.gitlab_groups[group].parent_id, null)
          })
        ] : []
        hooks = length(try(local.gitlab_groups[group].hooks, [])) > 0 ? [
          for hook in local.gitlab_groups[group].hooks : merge({
            group                      = try(local.gitlab_groups[group].name, group)
            parent_id                  = try(local.gitlab_groups[group].parent_id, null)
            url                        = hook.url
            confidential_issues_events = try(hook.confidential_issues_events, null)
            confidential_note_events   = try(hook.confidential_note_events, null)
            custom_webhook_template    = try(hook.custom_webhook_template, null)
            deployment_events          = try(hook.deployment_events, null)
            enable_ssl_verification    = try(hook.enable_ssl_verification, null)
            issues_events              = try(hook.issues_events, null)
            job_events                 = try(hook.job_events, null)
            merge_requests_events      = try(hook.merge_requests_events, null)
            note_events                = try(hook.note_events, null)
            pipeline_events            = try(hook.pipeline_events, null)
            push_events                = try(hook.push_events, null)
            push_events_branch_filter  = try(hook.push_events_branch_filter, null)
            releases_events            = try(hook.releases_events, null)
            subgroup_events            = try(hook.subgroup_events, null)
            tag_push_events            = try(hook.tag_push_events, null)
            wiki_page_events           = try(hook.wiki_page_events, null)
            token                      = try(hook.token, null)
          })
        ] : []
        issue_boards = length(try(local.gitlab_groups[group].issue_boards, [])) > 0 ? [
          for board in local.gitlab_groups[group].issue_boards : merge({
            group        = try(local.gitlab_groups[group].name, group)
            name         = board.name
            labels       = try(board.labels, [])
            lists        = try(board.lists, [])
            milestone_id = try(board.milestone_id, null)
          })
        ] : []
        ldap_link = try(local.gitlab_groups[group].ldap_link, null) != null ? {
          group         = try(local.gitlab_groups[group].name, group)
          ldap_provider = local.gitlab_groups[group].ldap_link.ldap_provider
          cn            = try(local.gitlab_groups[group].ldap_link.cn, null)
          filter        = try(local.gitlab_groups[group].ldap_link.filter, null)
          force         = try(local.gitlab_groups[group].ldap_link.force, null)
          group_access  = try(local.gitlab_groups[group].ldap_link.group_access, null)
        } : {}
        # saml_link
        saml_link = try(local.gitlab_groups[group].saml_link, null) != null ? {
          group           = try(local.gitlab_groups[group].name, group)
          access_level    = try(local.gitlab_groups[group].saml_link.access_level, null)
          saml_group_name = try(local.gitlab_groups[group].saml_link.saml_group_name, null)
        } : {}
        # share_group
        share_groups = length(try(local.gitlab_groups[group].share_groups, [])) > 0 ? [
          for share in local.gitlab_groups[group].share_groups : merge({
            group_id       = try(local.gitlab_groups[group].name, group)
            group_access   = share.group_access
            share_group_id = share.share_group_id
            expires_at     = try(share.expires_at, null)
            parent_id      = try(local.gitlab_groups[group].parent_id, null)
          })
        ] : []
        project_file_template = try(local.gitlab_groups[group].project_file_template, null)
        protected_environments = length(try(local.gitlab_groups[group].protected_environments, [])) > 0 ? [
          for env in local.gitlab_groups[group].protected_environments : merge({
            group       = try(local.gitlab_groups[group].name, group)
            environment = env.environment
            deploy_access_levels = [for lvl in env.deploy_access_levels : merge({
              access_level           = try(lvl.access_level, null)
              group_id               = try(lvl.group_id, null)
              group_inheritance_type = try(lvl.group_inheritance_type, null)
              user_id                = try(lvl.user_id, null)
            })]
            approval_rules = length(try(env.approval_rules, [])) > 0 ? [for rule in env.approval_rules : merge({
              access_level           = try(rule.access_level, null)
              group_id               = try(rule.group_id, null)
              group_inheritance_type = try(rule.group_inheritance_type, null)
              user_id                = try(rule.user_id, null)
            })] : []
            required_approval_count = try(env.required_approval_count, null)
          })
        ] : []
        variables = length(try(local.gitlab_groups[group].variables, [])) > 0 ? [
          for v in local.gitlab_groups[group].variables : merge({
            group             = try(local.gitlab_groups[group].name, group)
            key               = v.key
            value             = v.value
            description       = try(v.description, null)
            environment_scope = try(v.environment_scope, "*")
            masked            = try(v.masked, false)
            protected         = try(v.protected, false)
            raw               = try(v.raw, false)
            variable_type     = try(v.variable_type, "env_var")
          })
        ] : []
        membership = length(try(local.gitlab_groups[group].membership, [])) > 0 ? [
          for member in local.gitlab_groups[group].membership : merge({
            user_id = member.user_id
            group_id : member.group_id
            access_level : member.access_level
            expires_at                    = try(member.expires_at, null)
            member_role_id                = try(member.member_role_id, null)
            skip_subresources_on_destroy  = try(member.skip_subresources_on_destroy, null)
            unassign_issuables_on_destroy = try(member.unassign_issuables_on_destroy, null)
          })
        ] : []
        deploy_tokens = length(try(local.gitlab_groups[group].deploy_tokens, [])) > 0 ? [
          for token in local.gitlab_groups[group].deploy_tokens : merge({
            group      = try(local.gitlab_groups[group].name, group)
            name       = token.name
            scopes     = token.scopes
            expires_at = try(token.expires_at, null)
            username   = try(token.username, null)
          })
        ] : []
      }
    )
  }
  parent_groups = { for k, v in local.groups : k => v if v.parent_id == null }
  other_groups  = { for k, v in local.groups : k => v if v.parent_id != null }
}

data "gitlab_group" "this" {
  for_each = local.other_groups

  full_path = each.value.parent_id
  depends_on = [
    gitlab_group.parent
  ]
}

resource "gitlab_group" "parent" {
  for_each = local.parent_groups

  name                               = each.value.name
  path                               = each.value.path
  auto_devops_enabled                = each.value.auto_devops_enabled
  avatar                             = each.value.avatar
  avatar_hash                        = each.value.avatar_hash
  default_branch_protection          = each.value.default_branch_protection
  description                        = each.value.description
  emails_enabled                     = each.value.emails_enabled
  extra_shared_runners_minutes_limit = each.value.extra_shared_runners_minutes_limit
  ip_restriction_ranges              = each.value.ip_restriction_ranges
  lfs_enabled                        = each.value.lfs_enabled
  membership_lock                    = each.value.membership_lock
  mentions_disabled                  = each.value.mentions_disabled
  parent_id                          = each.value.parent_id // != null ? data.gitlab_group.this[each.value.name].id : null // each.value.parent_id
  prevent_forking_outside_group      = each.value.prevent_forking_outside_group
  project_creation_level             = each.value.project_creation_level
  dynamic "push_rules" {
    for_each = length(each.value.push_rules) > 0 ? toset(each.value.push_rules) : []
    iterator = rule
    content {
      author_email_regex            = try(rule.value.author_email_regex, null)
      branch_name_regex             = try(rule.value.branch_name_regex, null)
      commit_committer_check        = try(rule.value.commit_committer_check, null)
      commit_message_negative_regex = try(rule.value.commit_message_negative_regex, null)
      commit_message_regex          = try(rule.value.commit_message_regex, null)
      deny_delete_tag               = try(rule.value.deny_delete_tag, null)
      file_name_regex               = try(rule.value.file_name_regex, null)
      max_file_size                 = try(rule.value.max_file_size, null)
      member_check                  = try(rule.value.member_check, null)
      prevent_secrets               = try(rule.value.prevent_secrets, null)
      reject_unsigned_commits       = try(rule.value.reject_unsigned_commits, null)
    }
  }
  request_access_enabled            = each.value.request_access_enabled
  require_two_factor_authentication = each.value.require_two_factor_authentication
  share_with_group_lock             = each.value.share_with_group_lock
  shared_runners_minutes_limit      = each.value.shared_runners_minutes_limit
  shared_runners_setting            = each.value.shared_runners_setting
  subgroup_creation_level           = each.value.subgroup_creation_level
  two_factor_grace_period           = each.value.two_factor_grace_period
  visibility_level                  = each.value.visibility_level
  wiki_access_level                 = each.value.wiki_access_level
}

resource "gitlab_group" "other" {
  for_each = local.other_groups

  name                               = each.value.name
  path                               = each.value.path
  auto_devops_enabled                = each.value.auto_devops_enabled
  avatar                             = each.value.avatar
  avatar_hash                        = each.value.avatar_hash
  default_branch_protection          = each.value.default_branch_protection
  description                        = each.value.description
  emails_enabled                     = each.value.emails_enabled
  extra_shared_runners_minutes_limit = each.value.extra_shared_runners_minutes_limit
  ip_restriction_ranges              = each.value.ip_restriction_ranges
  lfs_enabled                        = each.value.lfs_enabled
  membership_lock                    = each.value.membership_lock
  mentions_disabled                  = each.value.mentions_disabled
  parent_id                          = data.gitlab_group.this[each.value.name].id
  prevent_forking_outside_group      = each.value.prevent_forking_outside_group
  project_creation_level             = each.value.project_creation_level
  dynamic "push_rules" {
    for_each = length(each.value.push_rules) > 0 ? toset(each.value.push_rules) : []
    iterator = rule
    content {
      author_email_regex            = try(rule.value.author_email_regex, null)
      branch_name_regex             = try(rule.value.branch_name_regex, null)
      commit_committer_check        = try(rule.value.commit_committer_check, null)
      commit_message_negative_regex = try(rule.value.commit_message_negative_regex, null)
      commit_message_regex          = try(rule.value.commit_message_regex, null)
      deny_delete_tag               = try(rule.value.deny_delete_tag, null)
      file_name_regex               = try(rule.value.file_name_regex, null)
      max_file_size                 = try(rule.value.max_file_size, null)
      member_check                  = try(rule.value.member_check, null)
      prevent_secrets               = try(rule.value.prevent_secrets, null)
      reject_unsigned_commits       = try(rule.value.reject_unsigned_commits, null)
    }
  }
  request_access_enabled            = each.value.request_access_enabled
  require_two_factor_authentication = each.value.require_two_factor_authentication
  share_with_group_lock             = each.value.share_with_group_lock
  shared_runners_minutes_limit      = each.value.shared_runners_minutes_limit
  shared_runners_setting            = each.value.shared_runners_setting
  subgroup_creation_level           = each.value.subgroup_creation_level
  two_factor_grace_period           = each.value.two_factor_grace_period
  visibility_level                  = each.value.visibility_level
  wiki_access_level                 = each.value.wiki_access_level
  depends_on = [
    gitlab_group.parent
  ]
}


resource "gitlab_group_access_token" "this" {
  for_each = {
    for token in flatten([for g in local.groups : g.access_tokens if length(g.access_tokens) > 0]) :
    token.name => token
  }
  group        = each.value.group
  name         = each.value.name
  scopes       = each.value.scopes
  access_level = each.value.access_level
  expires_at   = each.value.expires_at
  rotation_configuration = each.value.rotation_configuration != null ? {
    expiration_days    = try(each.value.rotation_configuration.expiration_days, null)
    rotate_before_days = try(each.value.rotation_configuration.rotate_before_days, null)
  } : null
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}

resource "gitlab_group_badge" "this" {
  for_each = {
    for badge in flatten([for g in local.groups : g.badges if length(g.badges) > 0]) :
    badge.link_url => badge
  }
  group     = each.value.group
  link_url  = each.value.link_url
  image_url = each.value.image_url
  name      = each.value.name
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}

resource "gitlab_group_custom_attribute" "this" {
  for_each = {
    for attr in flatten([for g in local.groups : g.custom_attributes if length(g.custom_attributes) > 0]) :
    attr.key => attr
  }
  group = each.value.parent_id == null ? gitlab_group.parent[each.value.group].id : gitlab_group.other[each.value.group].id
  key   = each.value.key
  value = each.value.value
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}


resource "gitlab_group_label" "this" {
  for_each = {
    for label in flatten([for g in local.groups : g.labels if length(g.labels) > 0]) :
    label.name => label
  }

  group       = each.value.group
  name        = each.value.name
  description = each.value.description
  color       = each.value.color
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}



resource "gitlab_group_epic_board" "this" {
  for_each = {
    for board in flatten([for g in local.groups :
    g.epic_boards if contains(["premium", "ultimate"], lower(var.tier)) && length(g.epic_boards) > 0]) :
    board.name => board
  }
  name  = tostring(each.value.name)
  group = tostring(each.value.parent_id == null ? gitlab_group.parent[each.value.group].id : gitlab_group.other[each.value.group].id)
  dynamic "lists" {
    for_each = length(each.value.lists) > 0 ? toset(each.value.lists) : []
    iterator = rule
    content {
      label_id = tonumber(gitlab_group_label.this[rule.value.label_id].label_id)
    }
  }
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other,
    gitlab_group_label.this
  ]
}


resource "gitlab_group_hook" "this" {
  for_each = {
    for hook in flatten([for g in local.groups : g.hooks
    if contains(["premium", "ultimate"], lower(var.tier)) && length(g.hooks) > 0]) :
    hook.url => hook
  }

  group                      = each.value.parent_id == null ? gitlab_group.parent[each.value.group].id : gitlab_group.other[each.value.group].id
  url                        = each.value.url
  confidential_issues_events = each.value.confidential_issues_events
  confidential_note_events   = each.value.confidential_note_events
  custom_webhook_template    = each.value.custom_webhook_template
  deployment_events          = each.value.deployment_events
  enable_ssl_verification    = each.value.enable_ssl_verification
  issues_events              = each.value.issues_events
  job_events                 = each.value.job_events
  merge_requests_events      = each.value.merge_requests_events
  note_events                = each.value.note_events
  pipeline_events            = each.value.pipeline_events
  push_events                = each.value.push_events
  push_events_branch_filter  = each.value.push_events_branch_filter
  releases_events            = each.value.releases_events
  subgroup_events            = each.value.subgroup_events
  tag_push_events            = each.value.tag_push_events
  token                      = each.value.token
  wiki_page_events           = each.value.wiki_page_events
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}

/*
resource "gitlab_group_issue_board" "this" {
  for_each = {
    for board in flatten([ for g in local.groups: g.issue_boards 
    if length(g.issue_boards) > 0 ]): 
    board.name => board
  }
  name   = each.value.name
  group  = each.value.group
  labels = each.value.labels
  dynamic "lists" {
    for_each = length(each.value.lists) > 0 ? toset(each.value.lists) : []
    iterator = rule
    content {
      label_id = gitlab_group_label.this[rule.value.label_id].label_id
      position = rule.value.position
    }
  }
  milestone_id = each.value.milestone_id
  depends_on   = [
    gitlab_group.this,
    gitlab_group_label.this
  ]
}
*/


resource "gitlab_group_ldap_link" "this" {
  for_each = {
    for g in local.groups :
    g.name => merge(g.ldap_link, { parent_id : g.parent_id })
    if length(keys(g.ldap_link)) > 0
  }

  group         = each.value.parent_id == null ? gitlab_group.parent[each.value.group].id : gitlab_group.other[each.value.group].id
  ldap_provider = each.value.ldap_provider
  cn            = each.value.cn
  filter        = each.value.filter
  force         = each.value.force
  group_access  = each.value.group_access
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}

// Lookup membership group to get id
data "gitlab_group" "membership_group" {
  for_each = toset(flatten([for g in local.groups : g.membership[*].group_id if length(g.membership) > 0]))

  full_path = each.value
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}

// Lookup membership user to get id
data "gitlab_user" "membership_user" {
  for_each = toset(flatten([for g in local.groups : g.membership[*].user_id if length(g.membership) > 0]))
  username = each.value

  depends_on = [
    gitlab_user.this
  ]
}

resource "gitlab_group_membership" "this" {
  for_each = { for m in flatten([
    for g in local.groups :
    g.membership if length(g.membership) > 0
  ]) : m.user_id => m }
  access_level                  = each.value.access_level
  group_id                      = data.gitlab_group.membership_group[each.value.group_id].id
  user_id                       = data.gitlab_user.membership_user[each.value.user_id].id
  expires_at                    = each.value.expires_at
  member_role_id                = each.value.member_role_id
  skip_subresources_on_destroy  = each.value.skip_subresources_on_destroy
  unassign_issuables_on_destroy = each.value.unassign_issuables_on_destroy
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}


/*
// https://docs.gitlab.com/ee/user/group/custom_project_templates.html
resource "gitlab_group_project_file_template" "this" {
  for_each                 = {
    for g in local.groups :
    g.name => g.project_file_template != null ? g.project_file_template : {}
  }
  group_id                 = gitlab_group.this[each.value.name].id
  file_template_project_id = try(each.value.project_file_template.file_template_project_id, null) //gitlab_project.this[each.value.project_file_template.file_template_project_id].id
  depends_on               = [gitlab_group.this]
}
*/


resource "gitlab_group_protected_environment" "this" {
  for_each = {
    for env in flatten([for g in local.groups : g.protected_environments
    if contains(["premium", "ultimate"], lower(var.tier)) && length(g.protected_environments) > 0]) :
    env.environment => env
  }

  deploy_access_levels    = each.value.deploy_access_levels
  environment             = each.value.environment
  group                   = each.value.group
  approval_rules          = each.value.approval_rules
  required_approval_count = each.value.required_approval_count
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}


resource "gitlab_group_saml_link" "this" {
  for_each = {
    for g in local.groups :
    g.name => merge(g.saml_link, { parent_id : g.parent_id })
    if length(keys(g.saml_link)) > 0
  }

  group           = each.value.parent_id == null ? gitlab_group.parent[each.value.group].id : gitlab_group.other[each.value.group].id
  access_level    = each.value.access_level
  saml_group_name = each.value.saml_group_name
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}

// Lookup the share group id 
data "gitlab_group" "share_group_id" {
  for_each = {
    for group in flatten([for g in local.groups : g.share_groups if length(g.share_groups) > 0]) :
    group.share_group_id => group
  }

  full_path = each.value.share_group_id
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}

// Lookup group id
data "gitlab_group" "group_id" {
  for_each = {
    for group in flatten([for g in local.groups : g.share_groups if length(g.share_groups) > 0]) :
    group.group_id => group
  }

  full_path = each.value.group_id
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}

resource "gitlab_group_share_group" "test" {
  for_each = {
    for group in flatten([for g in local.groups : g.share_groups if length(g.share_groups) > 0]) :
    group.share_group_id => group
  }

  group_id       = data.gitlab_group.group_id[each.value.group_id].id
  share_group_id = data.gitlab_group.share_group_id[each.value.share_group_id].id
  group_access   = each.value.group_access
  expires_at     = each.value.expires_at
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}

resource "gitlab_group_variable" "this" {
  for_each = {
    for v in flatten([for g in local.groups : g.variables if length(g.variables) > 0]) :
    v.key => v
  }

  group             = each.value.group
  key               = each.value.key
  value             = each.value.value
  protected         = each.value.protected
  masked            = each.value.masked
  environment_scope = each.value.environment_scope
  description       = each.value.description
  raw               = each.value.raw
  variable_type     = each.value.variable_type
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}

resource "gitlab_deploy_token" "group" {
  for_each = {
    for token in flatten([for g in local.groups : g.deploy_tokens if length(g.deploy_tokens) > 0]) :
    token.name => token
  }

  group      = each.value.group
  name       = each.value.name
  scopes     = each.value.scopes
  expires_at = each.value.expires_at
  username   = each.value.username
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}

data "gitlab_groups" "exists_groups" {
  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}

locals {
  exists_groups = { for group in data.gitlab_groups.exists_groups.groups : group.name => group }
}
