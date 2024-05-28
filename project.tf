
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
    push_rules                                       = try(project.push_rules, [])
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
    timeouts                                         = try(project.timeouts, [])
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
        confidential_issues_events = try(hook.confidential_issues_events, false)
        confidential_note_events   = try(hook.confidential_note_events, false)
        custom_webhook_template    = try(hook.custom_webhook_template, false)
        deployment_events          = try(hook.deployment_events, false)
        enable_ssl_verification    = try(hook.enable_ssl_verification, false)
        issues_events              = try(hook.issues_events, false)
        job_events                 = try(hook.job_events, false)
        merge_requests_events      = try(hook.merge_requests_events, false)
        note_events                = try(hook.note_events, false)
        pipeline_events            = try(hook.pipeline_events, false)
        push_events                = try(hook.push_events, false)
        push_events_branch_filter  = try(hook.push_events_branch_filter, false)
        releases_events            = try(hook.releases_events, false)
        subgroup_events            = try(hook.subgroup_events, false)
        tag_push_events            = try(hook.tag_push_events, false)
        wiki_page_events           = try(hook.wiki_page_events, false)
        token                      = try(hook.token, null)
      })
    ] : []
    variables = length(try(project.variables, [])) > 0 ? [
      for v in project.variables : merge({
        project           = project.name
        key               = v.key
        value             = v.value
        project_id        = try(v.project_id, null)
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
    memberships = length(try(project.memberships, [])) > 0 ? [
      for member in project.memberships : merge({
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
    } : null
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
    } : null
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
    level_mr_approvals = length(keys(try(project.level_mr_approvals, {}))) > 0 ? {
      project                                        = project.name
      disable_overriding_approvers_per_merge_request = try(project.level_mr_approvals.disable_overriding_approvers_per_merge_request, null)
      merge_requests_author_approval                 = try(project.level_mr_approvals.merge_requests_author_approval, null)
      merge_requests_disable_committers_approval     = try(project.level_mr_approvals.merge_requests_disable_committers_approval, null)
      require_password_to_approve                    = try(project.level_mr_approvals.require_password_to_approve, null)
      reset_approvals_on_push                        = try(project.level_mr_approvals.reset_approvals_on_push, null)
      selective_code_owner_removals                  = try(project.level_mr_approvals.selective_code_owner_removals, null)
    } : null
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
    level_notifications = can(project.level_notifications) ? {
      project = try(project.level_notifications.project, project.name),
      level   = project.level_notifications.level
    } : null
    additional_tags = length(try(project.additional_tags, [])) > 0 ? [
      for tag in project.additional_tags : merge({
        project             = project.name
        name                = tag.name
        ref                 = tag.ref
        message             = try(tag.message, null)
        protected           = try(tag.protected, false)
        create_access_level = try(tag.create_access_level, null)
        allowed_to_create = length(try(tag.allowed_to_create, [])) > 0 ? [
          for allowed in tag.allowed_to_create : {
            group_id = try(allowed.group_id, null),
            user_id  = try(allowed.user_id, null)
          }
        ] : []
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
    } : null
    pipeline_schedules = length(try(project.pipeline_schedule, [])) > 0 ? [
      for pipeline in project.pipeline_schedule : merge({
        project = project.name
        }, pipeline
      )
    ] : []
    compliance_frameworks = length(try(project.compliance_frameworks, [])) > 0 ? [
      for framework in project.compliance_frameworks : merge({
        project = project.name
      }, framework)
    ] : []
    branches = length(try(project.branches, [])) > 0 ? [
      for branch in project.branches : merge({
        project = project.name
      }, branch)
    ] : []
    license = try(project.license, null) != null ? {
      approval_status = try(project.license.approval_status, "allowed")
      name            = project.license.name
      project         = project.name
    } : null
    pipeline_triggers = length(try(project.pipeline_triggers, [])) > 0 ? [
      for trigger in project.pipeline_triggers : {
        description = trigger.description,
        project     = project.name
      }
    ] : []
    release_links = length(try(project.release_links, [])) > 0 ? [
      for release in project.release_links : {
        project   = project.name
        tag_name  = release.tag_name
        name      = release.name
        url       = release.url
        filepath  = try(release.filepath, null)
        link_type = try(release.link_type, null)
      }
    ] : []
    // repository_files = length(try(project.release_links, [])) > 0 ? [
    repository_files = length(try(project.repository_files, [])) > 0 ? [
      for file in project.repository_files : {
        project               = project.name
        file_path             = file.file_path
        branch                = file.branch
        content               = base64encode(file.content)
        author_email          = try(file.author_email, null)
        author_name           = try(file.author_name, null)
        commit_message        = try(file.commit_message, null)
        create_commit_message = try(file.create_commit_message, null)
        delete_commit_message = try(file.delete_commit_message, null)
        encoding              = try(file.encoding, null)
        execute_filemode      = try(file.execute_filemode, null)
        overwrite_on_create   = try(file.overwrite_on_create, null)
        start_branch          = try(file.start_branch, null)
        update_commit_message = try(file.update_commit_message, null)
    }] : []
    integration_custom_issue_tracker = can(project.integration_custom_issue_tracker) ? merge({
      project = project.name
    }, project.integration_custom_issue_tracker) : null
    integration_emails_on_push = can(project.integration_emails_on_push) ? merge({
      project = project.name
    }, project.integration_emails_on_push) : null
    integration_external_wiki = can(project.integration_external_wiki) ? merge({
      project = project.name
    }, project.integration_external_wiki) : null
    integration_github = can(project.integration_github) ? merge({
      project = project.name
    }, project.integration_github) : null
    integration_jira = can(project.integration_jira) ? merge({
      project = project.name
    }, project.integration_jira) : null
    integration_mattermost = can(project.integration_mattermost) ? merge({
      project = project.name
    }, project.integration_mattermost) : null
    integration_microsoft_teams = can(project.integration_microsoft_teams) ? merge({
      project = project.name
    }, project.integration_microsoft_teams) : null
    integration_pipelines_email = can(project.integration_pipelines_email) ? merge({
      project = project.name
    }, project.integration_pipelines_email) : null
    integration_slack = can(project.integration_slack) ? merge({
      project = project.name
    }, project.integration_slack) : null
  }]

  projects = { for p in local._projects : p.name => p }
}


module "gitlab_project" {
  source = "github.com/saydulaev/terraform-module-gitlab-project?ref=ec70db2f9874c7e4243bdd88aa05b7a771e4d125"
  for_each = local.projects

  tier = var.tier
  project = {
    name                                             = each.value.name
    allow_merge_on_skipped_pipeline                  = each.value.allow_merge_on_skipped_pipeline
    analytics_access_level                           = each.value.analytics_access_level
    archive_on_destroy                               = each.value.archive_on_destroy
    archived                                         = each.value.archived
    auto_cancel_pending_pipelines                    = each.value.auto_cancel_pending_pipelines
    auto_devops_deploy_strategy                      = each.value.auto_devops_deploy_strategy
    auto_devops_enabled                              = each.value.auto_devops_enabled
    autoclose_referenced_issues                      = each.value.autoclose_referenced_issues
    avatar                                           = each.value.avatar
    avatar_hash                                      = each.value.avatar_hash
    build_git_strategy                               = each.value.build_git_strategy
    build_timeout                                    = each.value.build_timeout
    builds_access_level                              = each.value.builds_access_level
    ci_config_path                                   = each.value.ci_config_path
    ci_default_git_depth                             = each.value.ci_default_git_depth
    ci_forward_deployment_enabled                    = each.value.ci_forward_deployment_enabled
    ci_restrict_pipeline_cancellation_role           = each.value.ci_restrict_pipeline_cancellation_role
    ci_separated_caches                              = each.value.ci_separated_caches
    container_expiration_policy                      = each.value.container_expiration_policy
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
    push_rules                                       = each.value.push_rules
    releases_access_level                            = each.value.releases_access_level
    remove_source_branch_after_merge                 = each.value.remove_source_branch_after_merge
    repository_access_level                          = each.value.repository_access_level
    repository_storage                               = each.value.repository_storage
    request_access_enabled                           = each.value.request_access_enabled
    requirements_access_level                        = each.value.requirements_access_level
    resolve_outdated_diff_discussions                = each.value.resolve_outdated_diff_discussions
    restrict_user_defined_variables                  = each.value.restrict_user_defined_variables
    security_and_compliance_access_level             = each.value.security_and_compliance_access_level
    shared_runners_enabled                           = each.value.shared_runners_enabled
    skip_wait_for_default_branch_protection          = each.value.skip_wait_for_default_branch_protection
    snippets_access_level                            = each.value.snippets_access_level
    snippets_enabled                                 = each.value.snippets_enabled
    squash_commit_template                           = each.value.squash_commit_template
    squash_option                                    = each.value.squash_option
    suggestion_commit_message                        = each.value.suggestion_commit_message
    tags                                             = each.value.tags
    template_name                                    = each.value.template_name
    template_project_id                              = each.value.template_project_id
    timeouts                                         = each.value.timeouts
    topics                                           = each.value.topics
    use_custom_template                              = each.value.use_custom_template
    visibility_level                                 = each.value.visibility_level
    wiki_access_level                                = each.value.wiki_access_level
    wiki_enabled                                     = each.value.wiki_enabled
  }

  variables              = each.value.variables
  access_tokens          = each.value.access_tokens
  badges                 = each.value.badges
  custom_attributes      = each.value.custom_attributes
  labels                 = each.value.labels
  hooks                  = each.value.hooks
  milestones             = each.value.milestones
  issue_boards           = each.value.issue_boards
  memberships            = each.value.memberships
  mirror                 = each.value.mirroring
  approval_rules         = each.value.approval_rules
  compliance_frameworks  = each.value.compliance_frameworks
  environments           = each.value.environments
  freeze_period          = each.value.freeze_period
  job_token_scopes       = each.value.job_token_scopes
  level_mr_approvals     = null // each.value.level_mr_approvals
  runners                = each.value.runners
  share_groups           = each.value.share_groups
  level_notifications    = each.value.level_notifications
  pipeline_schedules     = each.value.pipeline_schedules
  protected_environments = each.value.protected_environments
  tags                   = each.value.additional_tags
  deploy_keys            = each.value.deploy_keys
  deploy_tokens          = each.value.deploy_tokens
  pages_domain           = each.value.pages_domain
  branches               = each.value.branches
  pipeline_triggers      = each.value.pipeline_triggers
  release_links          = each.value.release_links
  repository_files       = each.value.repository_files

  integration_custom_issue_tracker = each.value.integration_custom_issue_tracker
  integration_emails_on_push       = each.value.integration_emails_on_push
  integration_external_wiki        = each.value.integration_external_wiki
  integration_github               = each.value.integration_github
  integration_jira                 = each.value.integration_jira
  integration_mattermost           = each.value.integration_mattermost
  integration_microsoft_teams      = each.value.integration_microsoft_teams
  integration_pipelines_email      = each.value.integration_pipelines_email
  // integration_slack = each.value.integration_slack

  depends_on = [
    module.gitlab_group,
    module.gitlab_group_2_tier,
    module.gitlab_group_3_tier
  ]
}

module "gitlab_project_example_integration_slack" {
  source = "github.com/saydulaev/terraform-module-gitlab-project?ref=ec70db2f9874c7e4243bdd88aa05b7a771e4d125"

  tier = var.tier
  integration_slack = {
    project_id   = module.gitlab_project["example"].id
    webhook      = "https://webhook.com"
    username     = "myuser"
    push_events  = true
    push_channel = "push_chan"
  }
}

module "gitlab_project_example_vars" {
  source = "github.com/saydulaev/terraform-module-gitlab-project?ref=ec70db2f9874c7e4243bdd88aa05b7a771e4d125"

  variables = [
    {
      project_id  = module.gitlab_project["example"].id
      key         = "test_project_var"
      value       = "test_project_var_value"
      description = "test project var description"
    }
  ]
}