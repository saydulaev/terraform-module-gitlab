locals {
  groups = { for group in keys(local.gitlab_groups) : group =>
    merge(
      {
        name                               = try(local.gitlab_groups[group].name, group)
        path                               = try(local.gitlab_groups[group].path, group)
        auto_devops_enabled                = try(local.gitlab_groups[group].auto_devops_enabled, null)
        avatar                             = try(local.gitlab_groups[group].avatar, null)
        avatar_hash                        = try(local.gitlab_groups[group].avatar_hash, null)
        description                        = try(local.gitlab_groups[group].description, group)
        emails_enabled                     = try(local.gitlab_groups[group].emails_enabled, null)
        extra_shared_runners_minutes_limit = try(local.gitlab_groups[group].extra_shared_runners_minutes_limit, null)
        ip_restriction_ranges              = try(local.gitlab_groups[group].ip_restriction_ranges, null)
        lfs_enabled                        = try(local.gitlab_groups[group].lfs_enabled, null)
        membership_lock                    = try(local.gitlab_groups[group].membership_lock, null)
        mentions_disabled                  = try(local.gitlab_groups[group].mentions_disabled, null)
        parent_id                          = try(local.gitlab_groups[group].parent_id, null)
        prevent_forking_outside_group      = try(local.gitlab_groups[group].prevent_forking_outside_group, null)
        push_rules                         = try(local.gitlab_groups[group].push_rules, [])
        request_access_enabled             = try(local.gitlab_groups[group].request_access_enabled, null)
        require_two_factor_authentication  = try(local.gitlab_groups[group].require_two_factor_authentication, null)
        share_with_group_lock              = try(local.gitlab_groups[group].share_with_group_lock, null)
        shared_runners_minutes_limit       = try(local.gitlab_groups[group].shared_runners_minutes_limit, null)
        two_factor_grace_period            = try(local.gitlab_groups[group].two_factor_grace_period, null)
        default_branch_protection          = try(local.gitlab_groups[group].default_branch_protection, null)
        project_creation_level             = try(local.gitlab_groups[group].project_creation_level, null)
        shared_runners_setting             = try(local.gitlab_groups[group].shared_runners_setting, null)
        subgroup_creation_level            = try(local.gitlab_groups[group].subgroup_creation_level, null)
        visibility_level                   = try(local.gitlab_groups[group].visibility_level, null)
        wiki_access_level                  = try(local.gitlab_groups[group].wiki_access_level, null)
        access_tokens = length(try(local.gitlab_groups[group].access_tokens, [])) > 0 ? [
          for token in local.gitlab_groups[group].access_tokens : merge({
            id           = format("%s-%s", try(local.gitlab_groups[group].name, group), token.name)
            name         = token.name
            group        = try(local.gitlab_groups[group].group, null)
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
            group     = try(local.gitlab_groups[group].group, null)
            link_url  = badge.link_url
            image_url = badge.image_url
            name      = try(badge.name, null)
          })
        ] : []
        custom_attributes = length(try(local.gitlab_groups[group].custom_attributes, [])) > 0 ? [
          for attr in local.gitlab_groups[group].custom_attributes : merge({
            group     = try(local.gitlab_groups[group].group, null)
            key       = attr.key
            value     = try(attr.value, "")
            parent_id = try(local.gitlab_groups[group].parent_id, null)
          })
        ] : []
        labels = length(try(local.gitlab_groups[group].labels, [])) > 0 ? [
          for label in local.gitlab_groups[group].labels : merge({
            id          = format("%s-%s", try(local.gitlab_groups[group].name, group), label.name)
            group       = try(local.gitlab_groups[group].group, null)
            name        = label.name
            description = try(label.description, null)
            color       = label.color
          })
        ] : []
        epic_boards = length(try(local.gitlab_groups[group].epic_boards, [])) > 0 ? [
          for board in local.gitlab_groups[group].epic_boards : merge({
            group     = try(local.gitlab_groups[group].group, null)
            name      = board.name
            lists     = try(board.lists, [])
            parent_id = try(local.gitlab_groups[group].parent_id, null)
          })
        ] : []
        hooks = length(try(local.gitlab_groups[group].hooks, [])) > 0 ? [
          for hook in local.gitlab_groups[group].hooks : merge({
            group                      = try(local.gitlab_groups[group].group, null)
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
            group        = try(local.gitlab_groups[group].group, null)
            name         = board.name
            labels       = try(board.labels, [])
            lists        = try(board.lists, [])
            milestone_id = try(board.milestone_id, null)
          })
        ] : []
        ldap_link = try(local.gitlab_groups[group].ldap_link, null) != null ? {
          group         = try(local.gitlab_groups[group].group, null)
          ldap_provider = local.gitlab_groups[group].ldap_link.ldap_provider
          cn            = try(local.gitlab_groups[group].ldap_link.cn, null)
          filter        = try(local.gitlab_groups[group].ldap_link.filter, null)
          force         = try(local.gitlab_groups[group].ldap_link.force, null)
          group_access  = try(local.gitlab_groups[group].ldap_link.group_access, null)
        } : null
        # saml_link
        saml_link = try(local.gitlab_groups[group].saml_link, null) != null ? {
          group           = try(local.gitlab_groups[group].group, null)
          access_level    = try(local.gitlab_groups[group].saml_link.access_level, null)
          saml_group_name = try(local.gitlab_groups[group].saml_link.saml_group_name, null)
        } : null
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
            group       = try(local.gitlab_groups[group].group, null)
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
            group             = try(local.gitlab_groups[group].group, null)
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
            group      = try(local.gitlab_groups[group].group, null)
            name       = token.name
            scopes     = token.scopes
            expires_at = try(token.expires_at, null)
            username   = try(token.username, null)
          })
        ] : []
      }
    )
  }
  parent_groups = {
    for g in local.groups : g.name => merge(
      g, { child_groups = [for sg in local.groups : sg.name if sg.parent_id == g.name] }
    ) if g.parent_id == null
  }
  other_groups = {
    for g in local.groups : g.name => merge(
    g, { child_groups = [for sg in local.groups : sg.name if sg.parent_id == g.name] })
    if g.parent_id != null
  }
}

module "gitlab_group" {
  source = "github.com/saydulaev/terraform-module-gitlab-group?ref=eecb38c0cbc3376ed0a0e891b368fbdc9bf35634"
  for_each = local.parent_groups

  tier = var.tier
  group = {
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
    parent_id                          = each.value.parent_id
    prevent_forking_outside_group      = each.value.prevent_forking_outside_group
    project_creation_level             = each.value.project_creation_level
    push_rules                         = each.value.push_rules
    request_access_enabled             = each.value.request_access_enabled
    require_two_factor_authentication  = each.value.require_two_factor_authentication
    share_with_group_lock              = each.value.share_with_group_lock
    shared_runners_minutes_limit       = each.value.shared_runners_minutes_limit
    shared_runners_setting             = each.value.shared_runners_setting
    subgroup_creation_level            = each.value.subgroup_creation_level
    two_factor_grace_period            = each.value.two_factor_grace_period
    visibility_level                   = each.value.visibility_level
    wiki_access_level                  = each.value.wiki_access_level
  }
  access_tokens          = each.value.access_tokens
  badges                 = each.value.badges
  labels                 = each.value.labels
  variables              = each.value.variables
  epic_boards            = each.value.epic_boards
  saml_link              = each.value.saml_link
  ldap_link              = each.value.ldap_link
  hooks                  = each.value.hooks
  issue_boards           = each.value.issue_boards
  membership             = each.value.membership
  protected_environments = each.value.protected_environments
  share_groups           = each.value.share_groups
  deploy_tokens          = each.value.deploy_tokens

  depends_on = [
    module.gitlab_user
  ]
}

module "gitlab_group_2_tier" {
  source = "github.com/saydulaev/terraform-module-gitlab-group?ref=eecb38c0cbc3376ed0a0e891b368fbdc9bf35634"
  for_each = { for g in local.other_groups : g.name => g if length(g.child_groups) > 0 }

  tier = var.tier
  group = {
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
    parent_id                          = module.gitlab_group[each.value.parent_id].id
    prevent_forking_outside_group      = each.value.prevent_forking_outside_group
    project_creation_level             = each.value.project_creation_level
    push_rules                         = each.value.push_rules
    request_access_enabled             = each.value.request_access_enabled
    require_two_factor_authentication  = each.value.require_two_factor_authentication
    share_with_group_lock              = each.value.share_with_group_lock
    shared_runners_minutes_limit       = each.value.shared_runners_minutes_limit
    shared_runners_setting             = each.value.shared_runners_setting
    subgroup_creation_level            = each.value.subgroup_creation_level
    two_factor_grace_period            = each.value.two_factor_grace_period
    visibility_level                   = each.value.visibility_level
    wiki_access_level                  = each.value.wiki_access_level
  }
  access_tokens          = each.value.access_tokens
  badges                 = each.value.badges
  labels                 = each.value.labels
  variables              = each.value.variables
  epic_boards            = each.value.epic_boards
  saml_link              = each.value.saml_link
  ldap_link              = each.value.ldap_link
  hooks                  = each.value.hooks
  issue_boards           = each.value.issue_boards
  membership             = each.value.membership
  protected_environments = each.value.protected_environments
  share_groups           = each.value.share_groups
  deploy_tokens          = each.value.deploy_tokens
  depends_on = [
    module.gitlab_user
  ]
}


module "gitlab_group_3_tier" {
  source = "github.com/saydulaev/terraform-module-gitlab-group?ref=eecb38c0cbc3376ed0a0e891b368fbdc9bf35634"
  for_each = { for g in local.other_groups : g.name => g if length(g.child_groups) == 0 }

  tier = var.tier
  group = {
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
    parent_id                          = module.gitlab_group_2_tier[each.value.parent_id].id
    prevent_forking_outside_group      = each.value.prevent_forking_outside_group
    project_creation_level             = each.value.project_creation_level
    push_rules                         = each.value.push_rules
    request_access_enabled             = each.value.request_access_enabled
    require_two_factor_authentication  = each.value.require_two_factor_authentication
    share_with_group_lock              = each.value.share_with_group_lock
    shared_runners_minutes_limit       = each.value.shared_runners_minutes_limit
    shared_runners_setting             = each.value.shared_runners_setting
    subgroup_creation_level            = each.value.subgroup_creation_level
    two_factor_grace_period            = each.value.two_factor_grace_period
    visibility_level                   = each.value.visibility_level
    wiki_access_level                  = each.value.wiki_access_level
  }
  access_tokens          = each.value.access_tokens
  badges                 = each.value.badges
  labels                 = each.value.labels
  variables              = each.value.variables
  epic_boards            = each.value.epic_boards
  saml_link              = each.value.saml_link
  ldap_link              = each.value.ldap_link
  hooks                  = each.value.hooks
  issue_boards           = each.value.issue_boards
  membership             = each.value.membership
  protected_environments = each.value.protected_environments
  share_groups           = each.value.share_groups
  deploy_tokens          = each.value.deploy_tokens

  depends_on = [
    module.gitlab_group_2_tier,
    module.gitlab_user
  ]
}

data "gitlab_groups" "exists_groups" {
  depends_on = [
    module.gitlab_group,
    module.gitlab_group_2_tier,
    module.gitlab_group_3_tier,
  ]
}

locals {
  exists_groups = { for group in data.gitlab_groups.exists_groups.groups : group.name => group }
}

module "gitlab_group_share_test" {
  source = "github.com/saydulaev/terraform-module-gitlab-group?ref=eecb38c0cbc3376ed0a0e891b368fbdc9bf35634"

  share_groups = [
    {
      share_group_id = "test"
      group_id       = "devops"
      group_access   = "quest"
      group_access   = "reporter"
    }
  ]

  depends_on = [
    module.gitlab_group,
    module.gitlab_group_2_tier,
    module.gitlab_group_3_tier,
  ]
}