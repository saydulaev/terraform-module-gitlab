/**/
locals {
  _projects = [for project in local.gitlab_projects : {
    name                                             = project.name
    allow_merge_on_skipped_pipeline                  = try(project.allow_merge_on_skipped_pipeline, null)
    analytics_access_level                           = try(project.analytics_access_level, null)
    archive_on_destroy                               = try(project.archive_on_destroy, null)
    archived                                         = try(project.archived, null)
    auto_cancel_pending_pipelines                    = try(project.auto_cancel_pending_pipelines, null)
    auto_devops_deploy_strategy                      = try(project.auto_devops_deploy_strategy, null)
    auto_devops_enabled                              = try(project.auto_devops_enabled, null)
    autoclose_referenced_issues                      = try(project.autoclose_referenced_issues, null)
    avatar                                           = try(project.avatar, null)
    avatar_hash                                      = try(project.avatar_hash, null)
    build_git_strategy                               = try(project.build_git_strategy, null)
    build_timeout                                    = try(project.build_timeout, null)
    builds_access_level                              = try(project.builds_access_level, null)
    ci_config_path                                   = try(project.ci_config_path, null)
    ci_default_git_depth                             = try(project.ci_default_git_depth, null)
    ci_forward_deployment_enabled                    = try(project.ci_forward_deployment_enabled, null)
    ci_restrict_pipeline_cancellation_role           = try(project.ci_restrict_pipeline_cancellation_role, null)
    ci_separated_caches                              = try(project.ci_separated_caches, null)
    container_expiration_policy                      = try(project.container_expiration_policy, null)
    container_registry_access_level                  = try(project.container_registry_access_level, null)
    container_registry_enabled                       = try(project.container_registry_enabled, null)
    default_branch                                   = try(project.default_branch, null)
    description                                      = try(project.description, null)
    emails_disabled                                  = try(project.emails_disabled, null)
    emails_enabled                                   = try(project.emails_enabled, null)
    environments_access_level                        = try(project.environments_access_level, null)
    external_authorization_classification_label      = try(project.external_authorization_classification_label, null)
    feature_flags_access_level                       = try(project.feature_flags_access_level, null)
    forked_from_project_id                           = try(project.forked_from_project_id, null)
    forking_access_level                             = try(project.forking_access_level, null)
    group_runners_enabled                            = try(project.group_runners_enabled, null)
    group_with_project_templates_id                  = try(project.group_with_project_templates_id, null)
    import_url                                       = try(project.import_url, null)
    import_url_password                              = try(project.import_url_password, null)
    import_url_username                              = try(project.import_url_username, null)
    infrastructure_access_level                      = try(project.infrastructure_access_level, null)
    initialize_with_readme                           = try(project.initialize_with_readme, null)
    issues_access_level                              = try(project.issues_access_level, null)
    issues_enabled                                   = try(project.issues_enabled, null)
    issues_template                                  = try(project.issues_template, null)
    keep_latest_artifact                             = try(project.keep_latest_artifact, null)
    lfs_enabled                                      = try(project.lfs_enabled, null)
    merge_commit_template                            = try(project.merge_commit_template, null)
    merge_method                                     = try(project.merge_method, null)
    merge_pipelines_enabled                          = try(project.merge_pipelines_enabled, null)
    merge_requests_access_level                      = try(project.merge_requests_access_level, null)
    merge_requests_enabled                           = try(project.merge_requests_enabled, null)
    merge_requests_template                          = try(project.merge_requests_template, null)
    merge_trains_enabled                             = try(project.merge_trains_enabled, null)
    mirror                                           = try(project.mirror, null)
    mirror_overwrites_diverged_branches              = try(project.mirror_overwrites_diverged_branches, null)
    mirror_trigger_builds                            = try(project.mirror_trigger_builds, null)
    monitor_access_level                             = try(project.monitor_access_level, null)
    mr_default_target_self                           = try(project.mr_default_target_self, null)
    namespace_id                                     = try(project.namespace_id, null)
    only_allow_merge_if_all_discussions_are_resolved = try(project.only_allow_merge_if_all_discussions_are_resolved, null)
    only_allow_merge_if_pipeline_succeeds            = try(project.only_allow_merge_if_pipeline_succeeds, null)
    only_mirror_protected_branches                   = try(project.only_mirror_protected_branches, null)
    packages_enabled                                 = try(project.packages_enabled, null)
    pages_access_level                               = try(project.pages_access_level, null)
    path                                             = try(project.path, null)
    pipelines_enabled                                = try(project.pipelines_enabled, null)
    printing_merge_request_link_enabled              = try(project.printing_merge_request_link_enabled, null)
    public_builds                                    = try(project.public_builds, null)
    public_jobs                                      = try(project.public_jobs, null)
    push_rules                                       = try(project.push_rules, {})
    releases_access_level                            = try(project.releases_access_level, null)
    remove_source_branch_after_merge                 = try(project.remove_source_branch_after_merge, null)
    repository_access_level                          = try(project.repository_access_level, null)
    repository_storage                               = try(project.repository_storage, null)
    request_access_enabled                           = try(project.request_access_enabled, null)
    requirements_access_level                        = try(project.requirements_access_level, null)
    resolve_outdated_diff_discussions                = try(project.resolve_outdated_diff_discussions, null)
    restrict_user_defined_variables                  = try(project.restrict_user_defined_variables, null)
    security_and_compliance_access_level             = try(project.security_and_compliance_access_level, null)
    shared_runners_enabled                           = try(project.shared_runners_enabled, null)
    skip_wait_for_default_branch_protection          = try(project.skip_wait_for_default_branch_protection, null)
    snippets_access_level                            = try(project.snippets_access_level, null)
    snippets_enabled                                 = try(project.snippets_enabled, null)
    squash_commit_template                           = try(project.squash_commit_template, null)
    squash_option                                    = try(project.squash_option, null)
    suggestion_commit_message                        = try(project.suggestion_commit_message, null)
    tags                                             = try(project.tags, null)
    template_name                                    = try(project.template_name, null)
    template_project_id                              = try(project.template_project_id, null)
    timeouts                                         = try(project.timeouts, {})
    topics                                           = try(project.topics, null)
    use_custom_template                              = try(project.use_custom_template, null)
    visibility_level                                 = try(project.visibility_level, null)
    wiki_access_level                                = try(project.wiki_access_level, null)
    wiki_enabled                                     = try(project.wiki_enabled, null)
    labels = length(try(project.labels, [])) > 0 ? [
      for label in project.labels : merge({
        project     = project.name
        name        = label.name
        description = try(label.description, null)
        color       = label.color
      })
    ] : []
    issue_boards = length(try(project.issue_boards, [])) > 0 ? [
      for board in project.issue_boards : merge({
        project      = project.name
        name         = board.name
        labels       = try(board.labels, [])
        lists        = try(board.lists, [])
        milestone_id = try(board.milestone_id, null)
      })
    ] : []
    access_tokens = length(try(project.access_tokens, [])) > 0 ? [
      for token in project.access_tokens : merge({
        name         = token.name
        project      = project.name
        scopes       = can(tolist(token.scopes)) ? token.scopes : []
        access_level = token.access_level
        expires_at   = token.expires_at
        rotation_configuration = try(token.rotation_configuration, null) != null ? {
          expiration_days    = try(token.rotation_configuration.expiration_days, null)
          rotate_before_days = try(token.rotation_configuration.rotate_before_days, null)
        } : null
      })
    ] : []
    badges = length(try(project.badges, [])) > 0 ? [
      for badge in project.badges : merge({
        project   = project.name
        link_url  = badge.link_url
        image_url = badge.image_url
        name      = try(badge.name, null)
      })
    ] : []
    deploy_tokens = length(try(project.deploy_tokens, [])) > 0 ? [
      for token in project.deploy_tokens : merge({
        project    = project.name
        name       = token.name
        scopes     = token.scopes
        expires_at = try(token.expires_at, null)
        username   = try(token.username, null)
      })
    ] : []
    custom_attributes = length(try(project.custom_attributes, [])) > 0 ? [
      for attr in project.custom_attributes : merge({
        project = project.name
        key     = attr.key
        value   = try(attr.value, "")
      })
    ] : []
    hooks = length(try(project.hooks, [])) > 0 ? [
      for hook in project.hooks : merge({
        project = project.name
        // parent_id                  = try(local.gitlab_groups[group].parent_id, null)
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
    variables = length(try(project.variables, [])) > 0 ? [
      for v in project.variables : merge({
        project           = project.name
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
    protected_environments = length(try(project.protected_environments, [])) > 0 ? [
      for env in project.protected_environments : merge({
        project     = project.name
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
    issue_boards = length(try(project.issue_boards, [])) > 0 ? [
      for board in project.issue_boards : merge({
        project      = project.name
        name         = board.name
        labels       = try(board.labels, [])
        lists        = try(board.lists, [])
        milestone_id = try(board.milestone_id, null)
        assignee_id  = try(board.assignee_id, null)
        weight       = try(board.weight, null)
      })
    ] : []
    milestones = length(try(project.milestones, [])) > 0 ? [
      for milestone in project.milestones : merge({
        project     = project.name
        title       = milestone.title
        description = try(milestone.description, milestone.title)
        due_date    = try(milestone.due_date, null)
        start_date  = try(milestone.start_date, null)
        state       = try(milestone.state, null)
      })
    ] : []
    membership = length(try(project.membership, [])) > 0 ? [
      for member in project.membership : merge({
        project      = project.name
        user_id      = member.user_id
        access_level = member.access_level
        expires_at   = try(member.expires_at, null)
      })
    ] : []
    mirroring = try(project.mirroring, null) != null ? {
      project                 = project.name
      url                     = project.mirroring.url
      enabled                 = try(project.mirroring.enabled, null)
      keep_divergent_refs     = try(project.mirroring.keep_divergent_refs, null)
      only_protected_branches = try(project.mirroring.only_protected_branches, null)
    } : {}
    approval_rules = length(try(project.approval_rules, [])) > 0 ? [
      for rule in project.approval_rules : merge({
        project                                               = project.name
        name                                                  = rule.name
        approvals_required                                    = rule.approvals_required
        applies_to_all_protected_branches                     = try(rule.applies_to_all_protected_branches, null)
        disable_importing_default_any_approver_rule_on_create = try(rule.disable_importing_default_any_approver_rule_on_create, null)
        user_ids                                              = try(rule.user_ids, [])
        group_ids                                             = try(rule.group_ids, [])
        protected_branch_ids                                  = try(rule.protected_branch_ids, [])
        rule_type                                             = try(rule.rule_type, null)
      })
    ] : []
    environments : length(try(project.environments, [])) > 0 ? [
      for env in project.environments : merge({
        project             = project.name
        name                = env.name
        external_url        = try(env.external_url, null)
        stop_before_destroy = try(env.stop_before_destroy, true)
      })
    ] : []
    freeze_period = try(project.freeze_period, null) != null ? {
      project       = project.name
      freeze_end    = project.freeze_period.freeze_end
      freeze_start  = project.freeze_period.freeze_start
      cron_timezone = try(project.freeze_period.cron_timezone, null)
    } : {}
    issues = length(try(project.issues, [])) > 0 ? [
      for i in project.issues : merge({
        project                                 = project.name
        title                                   = i.title
        assignee_ids                            = try(i.assignee_ids, null)
        confidential                            = try(i.confidential, null)
        created_at                              = try(i.created_at, null)
        delete_on_destroy                       = try(i.delete_on_destroy, null)
        description                             = try(i.description, null)
        discussion_locked                       = try(i.discussion_locked, null)
        discussion_to_resolve                   = try(i.discussion_to_resolve, null)
        due_date                                = try(i.due_date, null)
        epic_issue_id                           = try(i.epic_issue_id, null)
        iid                                     = try(i.iid, null)
        issue_type                              = try(i.issue_type, null)
        labels                                  = try(i.labels, null)
        merge_request_to_resolve_discussions_of = try(i.merge_request_to_resolve_discussions_of, null)
        milestone_id                            = try(i.milestone_id, null)
        state                                   = try(i.state, null)
        updated_at                              = try(i.updated_at, null)
        weight                                  = try(i.weight, null)
      })
    ] : []
    job_token_scopes = length(try(project.job_token_scopes, [])) > 0 ? [
      for scope in project.job_token_scopes : merge({
        project           = project.name
        target_project_id = scope.target_project_id
      })
    ] : []
    level_mr_approvals = length(try(project.level_mr_approvals, [])) > 0 ? {
      project                                        = project.name
      disable_overriding_approvers_per_merge_request = try(project.level_mr_approvals.disable_overriding_approvers_per_merge_request, null)
      merge_requests_author_approval                 = try(project.level_mr_approvals.merge_requests_author_approval, null)
      merge_requests_disable_committers_approval     = try(project.level_mr_approvals.merge_requests_disable_committers_approval, null)
      require_password_to_approve                    = try(project.level_mr_approvals.require_password_to_approve, null)
      reset_approvals_on_push                        = try(project.level_mr_approvals.reset_approvals_on_push, null)
      selective_code_owner_removals                  = try(project.level_mr_approvals.selective_code_owner_removals, null)
    } : {}
    runners = length(try(project.runners, [])) > 0 ? [
      for runner in project.runners : merge({
        project   = project.name
        runner_id = runner.runner_id
      })
    ] : []
    # share_group
    share_groups = length(try(project.share_groups, [])) > 0 ? [
      for share in project.share_groups : merge({
        group_id     = share.group_id
        project      = project.name
        group_access = try(share.group_access, null)
      })
    ] : []
    level_notifications = can(project.level_notifications) ? merge(
      { project = project.name },
      try(project.level_notifications.level, null) == "custom" ? project.level_notifications : null,
      contains(["disabled", "participating", "watch", "global", "mention"], try(project.level_notifications.level, "")) ? {
        level = project.level_notifications.level
      } : {}
    ) : {}
    tags = length(try(project.tags, [])) > 0 ? [
      for tag in project.tags : merge({
        project = project.name
        name    = tag.name
        ref     = tag.ref
        message = try(tag.message, null)
      })
    ] : []
    deploy_keys = length(try(project.deploy_keys, [])) > 0 ? [
      for dk in project.deploy_keys : merge({
        project  = project.name
        title    = dk.title
        key      = dk.key
        can_push = try(dk.can_push, false)
      })
    ] : []
    pages_domain = can(project.pages_domain) ? {
      project          = project.name
      domain           = project.pages_domain.domain
      key              = try(project.pages_domain.key, null)
      certificate      = try(project.pages_domain.certificate, null)
      auto_ssl_enabled = try(project.pages_domain.auto_ssl_enabled, null)
      expired          = try(project.pages_domain.expired, null)
    } : {}
    pipeline_schedule = length(try(project.pipeline_schedule, [])) > 0 ? [
      for pipeline in project.pipeline_schedule : merge({
        project = project.name
        }, pipeline
      )
    ] : []
  }]

  projects = { for p in local._projects : p.name => p }
}

resource "gitlab_project" "this" {
  for_each = local.projects

  name                                   = each.value.name
  allow_merge_on_skipped_pipeline        = each.value.allow_merge_on_skipped_pipeline
  analytics_access_level                 = each.value.analytics_access_level
  archive_on_destroy                     = each.value.archive_on_destroy
  archived                               = each.value.archived
  auto_cancel_pending_pipelines          = each.value.auto_cancel_pending_pipelines
  auto_devops_deploy_strategy            = each.value.auto_devops_deploy_strategy
  auto_devops_enabled                    = each.value.auto_devops_enabled
  autoclose_referenced_issues            = each.value.autoclose_referenced_issues
  avatar                                 = each.value.avatar
  avatar_hash                            = each.value.avatar_hash
  build_git_strategy                     = each.value.build_git_strategy
  build_timeout                          = each.value.build_timeout
  builds_access_level                    = each.value.builds_access_level
  ci_config_path                         = each.value.ci_config_path
  ci_default_git_depth                   = each.value.ci_default_git_depth
  ci_forward_deployment_enabled          = each.value.ci_forward_deployment_enabled
  ci_restrict_pipeline_cancellation_role = each.value.ci_restrict_pipeline_cancellation_role
  ci_separated_caches                    = each.value.ci_separated_caches
  dynamic "container_expiration_policy" {
    for_each = try(length(keys(each.value.container_expiration_policy)), 0) > 0 ? each.value.container_expiration_policy : {}
    iterator = policy
    content {
      cadence           = policy.value.cadence
      enabled           = policy.value.enabled
      keep_n            = policy.value.keep_n
      name_regex_delete = policy.value.name_regex_delete
      name_regex_keep   = policy.value.name_regex_keep
      older_than        = policy.value.older_than
    }
  }
  container_registry_access_level                  = each.value.container_registry_access_level
  default_branch                                   = each.value.default_branch
  description                                      = each.value.description
  emails_enabled                                   = each.value.emails_enabled
  environments_access_level                        = each.value.environments_access_level
  external_authorization_classification_label      = each.value.external_authorization_classification_label
  feature_flags_access_level                       = each.value.feature_flags_access_level
  forked_from_project_id                           = each.value.forked_from_project_id
  forking_access_level                             = each.value.forking_access_level
  group_runners_enabled                            = each.value.group_runners_enabled
  group_with_project_templates_id                  = each.value.group_with_project_templates_id
  import_url                                       = each.value.import_url
  import_url_password                              = each.value.import_url_password
  import_url_username                              = each.value.import_url_username
  infrastructure_access_level                      = each.value.infrastructure_access_level
  initialize_with_readme                           = each.value.initialize_with_readme
  issues_access_level                              = each.value.issues_access_level
  issues_enabled                                   = each.value.issues_enabled
  issues_template                                  = each.value.issues_template
  keep_latest_artifact                             = each.value.keep_latest_artifact
  lfs_enabled                                      = each.value.lfs_enabled
  merge_commit_template                            = each.value.merge_commit_template
  merge_method                                     = each.value.merge_method
  merge_pipelines_enabled                          = each.value.merge_pipelines_enabled
  merge_requests_access_level                      = each.value.merge_requests_access_level
  merge_requests_enabled                           = each.value.merge_requests_enabled
  merge_requests_template                          = each.value.merge_requests_template
  merge_trains_enabled                             = each.value.merge_trains_enabled
  mirror                                           = each.value.mirror
  mirror_overwrites_diverged_branches              = each.value.mirror_overwrites_diverged_branches
  mirror_trigger_builds                            = each.value.mirror_trigger_builds
  monitor_access_level                             = each.value.monitor_access_level
  mr_default_target_self                           = each.value.mr_default_target_self
  namespace_id                                     = each.value.namespace_id != null ? local.exists_groups[each.value.namespace_id].group_id : null
  only_allow_merge_if_all_discussions_are_resolved = each.value.only_allow_merge_if_all_discussions_are_resolved
  only_allow_merge_if_pipeline_succeeds            = each.value.only_allow_merge_if_pipeline_succeeds
  only_mirror_protected_branches                   = each.value.only_mirror_protected_branches
  packages_enabled                                 = each.value.packages_enabled
  pages_access_level                               = each.value.pages_access_level
  path                                             = each.value.path
  printing_merge_request_link_enabled              = each.value.printing_merge_request_link_enabled
  public_jobs                                      = each.value.public_jobs
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
  releases_access_level                   = each.value.releases_access_level
  remove_source_branch_after_merge        = each.value.remove_source_branch_after_merge
  repository_access_level                 = each.value.repository_access_level
  repository_storage                      = each.value.repository_storage
  request_access_enabled                  = each.value.request_access_enabled
  requirements_access_level               = each.value.requirements_access_level
  resolve_outdated_diff_discussions       = each.value.resolve_outdated_diff_discussions
  restrict_user_defined_variables         = each.value.restrict_user_defined_variables
  security_and_compliance_access_level    = each.value.security_and_compliance_access_level
  shared_runners_enabled                  = each.value.shared_runners_enabled
  skip_wait_for_default_branch_protection = each.value.skip_wait_for_default_branch_protection
  snippets_access_level                   = each.value.snippets_access_level
  snippets_enabled                        = each.value.snippets_enabled
  squash_commit_template                  = each.value.squash_commit_template
  squash_option                           = each.value.squash_option
  suggestion_commit_message               = each.value.suggestion_commit_message
  tags                                    = each.value.tags
  template_name                           = each.value.template_name
  template_project_id                     = each.value.template_project_id
  dynamic "timeouts" {
    for_each = length(each.value.timeouts) > 0 ? toset(each.value.timeouts) : []
    iterator = rule
    content {
      create = try(rule.value.create, null)
      delete = try(rule.value.delete, null)
    }
  }
  topics              = each.value.topics
  use_custom_template = each.value.use_custom_template
  visibility_level    = each.value.visibility_level
  wiki_access_level   = each.value.wiki_access_level
  wiki_enabled        = each.value.wiki_enabled

  depends_on = [
    gitlab_group.parent,
    gitlab_group.other
  ]
}

locals {
  access_tokens = {
    for token in flatten([for p in local.projects : p.access_tokens if length(p.access_tokens) > 0]) :
    token.name => token
  }
}

resource "gitlab_project_access_token" "this" {
  for_each = {
    for token in flatten([for p in local.projects : p.access_tokens if length(p.access_tokens) > 0]) :
    token.name => token
  }
  project      = gitlab_project.this[each.value.project].id
  name         = each.value.name
  scopes       = each.value.scopes
  access_level = each.value.access_level
  expires_at   = each.value.expires_at
  rotation_configuration = each.value.rotation_configuration != null ? {
    expiration_days    = try(each.value.rotation_configuration.expiration_days, null)
    rotate_before_days = try(each.value.rotation_configuration.rotate_before_days, null)
  } : null
  depends_on = [
    gitlab_project.this
  ]
}


data "gitlab_project_branches" "this" {
  for_each = local.projects

  project = gitlab_project.this[each.value.name].id
  depends_on = [
    gitlab_project.this
  ]
}

locals {
  project_branches = { for p in local.projects : p.name => { for branch in data.gitlab_project_branches.this[p.name].branches : branch.name => branch } }
}

resource "gitlab_project_approval_rule" "this" {
  for_each = {
    for rule in flatten([for p in local.projects : p.approval_rules if length(p.approval_rules) > 0 && contains(["premium", "ultimate"], lower(var.tier))]) :
    rule.name => rule
  }

  project                                               = gitlab_project.this[each.value.project].id
  name                                                  = each.value.name
  approvals_required                                    = each.value.approvals_required
  applies_to_all_protected_branches                     = each.value.applies_to_all_protected_branches
  disable_importing_default_any_approver_rule_on_create = each.value.disable_importing_default_any_approver_rule_on_create
  user_ids                                              = length(each.value.user_ids) > 0 ? [for user in each.value.user_ids : local.exists_users[user].id] : null
  group_ids                                             = length(each.value.group_ids) > 0 ? [for group in each.value.group_ids : local.exists_groups[group].group_id] : null
  // protected_branch_ids                                  = length(each.value.protected_branch_ids) > 0 ? [for branch in each.value.protected_branch_ids : local.project_branches[branch].id ] : null
  rule_type = each.value.rule_type
  depends_on = [
    gitlab_project.this
  ]
}

resource "gitlab_project_badge" "this" {
  for_each = {
    for badge in flatten([for p in local.projects : p.badges if length(p.badges) > 0]) :
    badge.link_url => badge
  }
  project   = gitlab_project.this[each.value.project].id // each.value.project
  link_url  = each.value.link_url
  image_url = each.value.image_url
  name      = each.value.name
  depends_on = [
    gitlab_project.this
  ]
}

resource "gitlab_project_compliance_framework" "this" {
  for_each = {
    for framework in flatten([for p in local.projects : p.compliance_frameworks if length(try(p.compliance_frameworks, [])) > 0 && contains(["premium", "ultimate"], lower(var.tier))]) :
    framework.compliance_framework_id => framework
  }

  compliance_framework_id = gitlab_compliance_framework.this[each.value.compliance_framework_id].framework_id
  project                 = gitlab_project.this[each.value.project].id

  depends_on = [
    gitlab_project.this,
    gitlab_compliance_framework.this
  ]
}

resource "gitlab_project_custom_attribute" "this" {
  for_each = {
    for attr in flatten([for p in local.projects : p.custom_attributes if length(p.custom_attributes) > 0]) :
    attr.key => attr
  }
  project = gitlab_project.this[each.value.project].id
  key     = each.value.key
  value   = each.value.value
  depends_on = [
    gitlab_project.this
  ]
}


resource "gitlab_project_environment" "this" {
  for_each = {
    for env in flatten([for p in local.projects : p.environments if length(try(p.environments, [])) > 0]) :
    env.name => env
  }
  project             = gitlab_project.this[each.value.project].id
  name                = each.value.name
  external_url        = each.value.external_url
  stop_before_destroy = each.value.stop_before_destroy
  depends_on = [
    gitlab_project.this
  ]
}

resource "gitlab_project_freeze_period" "this" {
  for_each = {
    for p in local.projects :
    p.name => p.freeze_period
    if length(keys(p.freeze_period)) > 0
  }

  project       = gitlab_project.this[each.value.project].id
  freeze_start  = each.value.freeze_start
  freeze_end    = each.value.freeze_end
  cron_timezone = each.value.cron_timezone
  depends_on = [
    gitlab_project.this
  ]
}

resource "gitlab_project_hook" "this" {
  for_each = {
    for hook in flatten([for p in local.projects : p.hooks
    if contains(["premium", "ultimate"], lower(var.tier)) && length(p.hooks) > 0]) :
    hook.url => hook
  }

  project                    = gitlab_project.this[each.value.group].id
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
  tag_push_events            = each.value.tag_push_events
  token                      = each.value.token
  wiki_page_events           = each.value.wiki_page_events
  depends_on = [
    gitlab_project.this
  ]
}

data "gitlab_project_milestones" "this" {
  for_each = local.projects

  project = gitlab_project.this[each.value.name].id
  depends_on = [
    gitlab_project.this,
    gitlab_project_milestone.this
  ]
}

/*
locals {
    exists_milestones = {for milestone in data.gitlab_project_milestones.this[*].milestones: milestone.title => milestone }
}
*/

output "welcome_issue_this" {

  value = [for p in local.projects : data.gitlab_project_milestones.this[p.name].milestones]
}



resource "gitlab_project_issue" "this" {
  for_each = {
    for issue in flatten([for p in local.projects : p.issues
    if length(p.issues) > 0]) :
    issue.title => issue
  }

  project                                 = gitlab_project.this[each.value.project].id
  title                                   = each.value.title
  assignee_ids                            = each.value.assignee_ids
  confidential                            = each.value.confidential
  created_at                              = each.value.created_at
  delete_on_destroy                       = each.value.delete_on_destroy
  description                             = <<EOT
  Welcome to the ${gitlab_project.this[each.value.project].name} project!
  EOT
  discussion_locked                       = each.value.discussion_locked // true
  discussion_to_resolve                   = each.value.discussion_to_resolve
  due_date                                = each.value.due_date
  epic_issue_id                           = each.value.epic_issue_id
  iid                                     = each.value.iid
  issue_type                              = each.value.issue_type
  labels                                  = each.value.labels
  merge_request_to_resolve_discussions_of = each.value.merge_request_to_resolve_discussions_of
  milestone_id                            = each.value.milestone_id
  state                                   = each.value.state
  updated_at                              = each.value.updated_at
  weight                                  = each.value.weight
  depends_on = [
    gitlab_project.this
  ]
}

resource "gitlab_project_issue_board" "this" {
  for_each = {
    for board in flatten([for p in local.projects : p.issue_boards
    if length(p.issue_boards) > 0]) :
    board.name => board
  }

  name        = each.value.name
  project     = gitlab_project.this[each.value.project].id
  assignee_id = each.value.assignee_id
  labels      = each.value.labels
  dynamic "lists" {
    for_each = length(each.value.lists) > 0 ? toset(each.value.lists) : []
    iterator = item
    content {
      assignee_id  = try(item.value.assignee_id, null)
      iteration_id = try(item.value.iteration_id, null)
      label_id     = try(item.value.label_id, null) != null ? gitlab_project_label.this[try(item.value.label_id, null)].label_id : null
      milestone_id = try(item.value.milestone_id, null) != null ? gitlab_project_milestone.this[item.value.milestone_id].milestone_id : null
    }
  }
  milestone_id = each.value.milestone_id != null ? gitlab_project_milestone.this[each.value.milestone_id].milestone_id : null
  weight       = each.value.weight
  depends_on = [
    gitlab_project.this,
    gitlab_project_label.this,
    gitlab_project_milestone.this
  ]
}

resource "gitlab_project_job_token_scope" "this" {
  for_each = {
    for scope in flatten([for p in local.projects : p.job_token_scopes
    if length(p.job_token_scopes) > 0]) :
    scope.target_project_id => scope
  }

  project           = gitlab_project.this[each.value.project].id
  target_project_id = local.exists_projects[each.value.target_project_id].id
  depends_on = [
    gitlab_project.this
  ]
}


resource "gitlab_project_label" "this" {
  for_each = {
    for label in flatten([for p in local.projects : p.labels if length(p.labels) > 0]) :
    label.name => label
  }

  project     = gitlab_project.this[each.value.project].id
  name        = each.value.name
  description = each.value.description
  color       = each.value.color
  depends_on = [
    gitlab_project.this
  ]
}


resource "gitlab_project_level_mr_approvals" "this" {
  for_each = {
    for level in flatten([for p in local.projects :
    p.level_mr_approvals if contains(["premium", "ultimate"], lower(var.tier)) && length(keys(p.level_mr_approvals)) > 0]) :
    level.project => level
  }

  project                                        = each.value.project
  disable_overriding_approvers_per_merge_request = each.value.disable_overriding_approvers_per_merge_request
  merge_requests_author_approval                 = each.value.merge_requests_author_approval
  merge_requests_disable_committers_approval     = each.value.merge_requests_disable_committers_approval
  require_password_to_approve                    = each.value.require_password_to_approve
  reset_approvals_on_push                        = each.value.reset_approvals_on_push
  selective_code_owner_removals                  = each.value.selective_code_owner_removals
  depends_on = [
    gitlab_project.this
  ]
}

/*
resource "gitlab_project_level_notifications" "this" {
  for_each = {
    for k,v in local.projects : k=>v.level_notifications 
    if can(v.level_notifications) && length(keys(v.level_notifications)) > 0
  }

  project                      = gitlab_project.this[each.value.project].id
  close_issue                  = try(each.value.close_issue, null)
  close_merge_request          = try(each.value.close_merge_request, null)
  failed_pipeline              = try(each.value.failed_pipeline, null)
  fixed_pipeline               = try(each.value.fixed_pipeline, null)
  issue_due                    = try(each.value.issue_due, null)
  level                        =  tostring(each.value.level) // try(each.value.level, null)
  merge_merge_request          = try(each.value.merge_merge_request, null)
  merge_when_pipeline_succeeds = try(each.value.merge_when_pipeline_succeeds, null)
  moved_project                = try(each.value.moved_project, null)
  new_issue                    = try(each.value.new_issue, null)
  new_merge_request            = try(each.value.new_merge_request, null)
  new_note                     = try(each.value.new_note, null)
  push_to_merge_request        = try(each.value.push_to_merge_request, null)
  reassign_issue               = try(each.value.reassign_issue, null)
  reassign_merge_request       = try(each.value.reassign_merge_request, null)
  reopen_issue                 = try(each.value.reopen_issue, null)
  reopen_merge_request         = try(each.value.reopen_merge_request, null)
  success_pipeline             = try(each.value.success_pipeline, null)
  depends_on = [
    gitlab_project.this
  ]
}
*/

resource "gitlab_project_membership" "this" {
  for_each = { for m in flatten([
    for p in local.projects :
    p.membership if length(p.membership) > 0
  ]) : m.user_id => m }

  project      = gitlab_project.this[each.value.project].id
  user_id      = contains(keys(local.exists_users), each.value.user_id) ? local.exists_users[each.value.user_id].id : null
  access_level = each.value.access_level
  expires_at   = each.value.expires_at
  depends_on = [
    gitlab_project.this,
    gitlab_user.this
  ]
}

resource "gitlab_project_milestone" "this" {
  for_each = { for milestone in flatten([
    for p in local.projects :
    p.milestones if length(p.milestones) > 0
  ]) : milestone.title => milestone }

  project     = gitlab_project.this[each.value.project].id
  title       = each.value.title
  description = each.value.description
  due_date    = each.value.due_date
  start_date  = each.value.start_date
  state       = each.value.state
  depends_on = [
    gitlab_project.this
  ]
}


resource "gitlab_project_mirror" "this" {
  for_each = {
    for p in local.projects :
    p.name => p.mirroring
    if length(keys(p.mirroring)) > 0
  }
  project                 = gitlab_project.this[each.value.project].id
  url                     = each.value.url
  enabled                 = each.value.enabled
  keep_divergent_refs     = each.value.keep_divergent_refs
  only_protected_branches = each.value.only_protected_branches

  depends_on = [
    gitlab_project.this
  ]
}

resource "gitlab_project_protected_environment" "this" {
  for_each = {
    for env in flatten([for p in local.projects : p.protected_environments
    if contains(["premium", "ultimate"], lower(var.tier)) && length(p.protected_environments) > 0]) :
    env.environment => env
  }

  environment = each.value.environment
  project     = each.value.project
  dynamic "deploy_access_levels" {
    for_each = length(try(each.value.deploy_access_levels, [])) > 0 ? each.value.deploy_access_levels : []
    iterator = lvl
    content {
      access_level           = try(lvl.value.access_level, null)
      group_id               = try(lvl.group_id, null)
      group_inheritance_type = try(lvl.group_inheritance_type, null)
      user_id                = try(lvl.user_id, null)
    }
  }
  approval_rules          = each.value.approval_rules
  required_approval_count = each.value.required_approval_count
  depends_on = [
    gitlab_project.this
  ]
}


resource "gitlab_project_runner_enablement" "this" {
  for_each = {
    for p in flatten([for p in local.projects : p.runners if length(p.runners) > 0]) :
    p.runner_id => p
  }

  project   = gitlab_project.this[each.value.project].id
  runner_id = each.value.runner_id

  depends_on = [
    gitlab_project.this
  ]
}


resource "gitlab_project_share_group" "this" {
  for_each = {
    for group in flatten([for p in local.projects : p.share_groups if length(p.share_groups) > 0]) :
    group.group_access => group
  }

  project      = gitlab_project.this[each.value.project].id
  group_id     = local.exists_groups[each.value.group_id].group_id
  group_access = each.value.group_access
  depends_on = [
    gitlab_project.this
  ]
}

resource "gitlab_project_tag" "this" {
  for_each = {
    for tag in flatten([for p in local.projects : p.tags if length(p.tags) > 0]) :
    tag.name => tag
  }
  project = each.value.project
  name    = each.value.name
  ref     = each.value.ref
  message = each.value.message
  depends_on = [
    gitlab_project.this
  ]
}

resource "gitlab_project_variable" "this" {
  for_each = {
    for v in flatten([for p in local.projects : p.variables if length(p.variables) > 0]) :
    v.key => v
  }

  project           = gitlab_project.this[each.value.project].id // each.value.project
  key               = each.value.key
  value             = each.value.value
  protected         = each.value.protected
  masked            = each.value.masked
  environment_scope = each.value.environment_scope
  description       = each.value.description
  raw               = each.value.raw
  variable_type     = each.value.variable_type
  depends_on = [
    gitlab_project.this
  ]
}


resource "gitlab_deploy_key" "this" {
  for_each = {
    for key in flatten([for p in local.projects : p.deploy_keys if length(p.deploy_keys) > 0]) :
    key.title => key
  }

  project  = each.value.project
  title    = each.value.title
  key      = each.value.key
  can_push = each.value.can_push
  depends_on = [
    gitlab_project.this
  ]
}

resource "gitlab_deploy_token" "project" {
  for_each = {
    for token in flatten([for p in local.projects : p.deploy_tokens if length(p.deploy_tokens) > 0]) :
    token.name => token
  }

  project    = each.value.project
  name       = each.value.name
  scopes     = each.value.scopes
  expires_at = each.value.expires_at
  username   = each.value.username
  depends_on = [
    gitlab_project.this
  ]
}



resource "gitlab_pages_domain" "this" {
  for_each = {
    for p in local.projects :
    p.name => p.pages_domain
    if length(keys(p.pages_domain)) > 0
  }

  project          = gitlab_project.this[each.value.project].id
  domain           = each.value.domain
  key              = each.value.key
  certificate      = each.value.certificate
  auto_ssl_enabled = each.value.auto_ssl_enabled
  expired          = each.value.expired
  depends_on = [
    gitlab_project.this
  ]
}

resource "gitlab_pipeline_schedule" "this" {
  for_each = {
    for pipeline in flatten([for p in local.projects : p.pipeline_schedule if length(p.pipeline_schedule) > 0]) :
    pipeline.ref => pipeline
  }

  project        = gitlab_project.this[each.value.project].id
  description    = each.value.description
  ref            = each.value.ref
  cron           = each.value.cron
  active         = try(each.value.active, null)
  cron_timezone  = try(each.value.cron_timezone, null)
  take_ownership = try(each.value.take_ownership, null)
  depends_on = [
    gitlab_project.this
  ]
}

resource "gitlab_pipeline_schedule_variable" "this" {
  for_each = {
    for ps in flatten([for p in local.projects : [for pipeline in p.pipeline_schedule :
      [for v in pipeline.variables :
        merge({ key = v.key, value = v.value, ref = pipeline.ref, project = p.name })
      ] if length(try(pipeline.variables, [])) > 0
    ] if length(p.pipeline_schedule) > 0]) : format("%s-%s", ps.project, ps.ref) => ps
  }

  project              = gitlab_project.this[each.value.project].id
  pipeline_schedule_id = gitlab_pipeline_schedule.this[each.value.ref].pipeline_schedule_id
  key                  = each.value.key
  value                = each.value.value
  depends_on = [
    gitlab_project.this,
    gitlab_pipeline_schedule.this
  ]
}

/*
resource "gitlab_pipeline_trigger" "this" {
  project     = "12345"
  description = "Used to trigger builds"
}
*/

data "gitlab_projects" "exists_projects" {
  depends_on = [
    gitlab_project.this
  ]
}

locals {
  exists_projects = { for project in data.gitlab_projects.exists_projects.projects : project.name => project }
}