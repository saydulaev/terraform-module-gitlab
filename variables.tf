variable "tier" {
  type        = string
  description = "Gitlab tier"
  default     = "free"
  validation {
    condition     = contains(["free", "premium", "ultimate"], lower(var.tier))
    error_message = "The tier value must be one of `free`, `premium`, `ultimate`"
  }
}

// Users vars
variable "users" {
  description = "manage the lifecycle of a users"
  type = list(object({
    email             = string           // The e-mail address of the user.
    name              = string           // The name of the user.
    username          = string           // The username of the user.
    can_create_group  = optional(bool)   // Boolean, defaults to false. Whether to allow the user to create groups.
    is_admin          = optional(bool)   // Boolean, defaults to false. Whether to enable administrative privileges
    is_external       = optional(bool)   // Boolean, defaults to false. Whether a user has access only to some internal or private projects. External users can only access projects to which they are explicitly granted access.
    namespace_id      = optional(number) // The ID of the user's namespace. Available since GitLab 14.10.
    note              = optional(string) // The note associated to the user.
    password          = optional(string) // The password of the user.
    projects_limit    = optional(number) // Integer, defaults to 0. Number of projects user can create.
    reset_password    = optional(bool)   // Boolean, defaults to false. Send user password reset link.
    skip_confirmation = optional(bool)   // Boolean, defaults to true. Whether to skip confirmation.
    state             = optional(string) // String, defaults to 'active'. The state of the user account. Valid values are active, deactivated, blocked.
  }))
  default = []
}

variable "user_custom_attribute " {
  description = "Manage custom attributes for a user."
  type = list(object({
    key   = string // Key for the Custom Attribute.
    user  = string // The id of the user.
    value = string // Value for the Custom Attribute.
  }))
  default = []
}

variable "user_gpgkeys" {
  description = "Manage the lifecycle of a GPG keys assigned to the current user or a specific user."
  type = list(object({
    key     = string           // The armored GPG public key.
    user_id = optional(number) // The ID of the user to add the GPG key to. If this field is omitted, this resource manages a GPG key for the current user. 
  }))
  default = []
}

variable "user_sshkeys" {
  description = "Manage the lifecycle of an SSH key assigned to a user."
  type = list(object({
    key        = string           // The ssh key. The SSH key comment (trailing part) is optional and ignored for diffing, because GitLab overrides it with the username and GitLab hostname.
    title      = string           // The title of the ssh key.
    expires_at = optional(string) // The expiration date of the SSH key in ISO 8601 format (YYYY-MM-DDTHH:MM:SSZ)
    user_id    = optional(number) // The ID or username of the user. If this field is omitted, this resource manages a SSH key for the current user. 
  }))
  default = []
}

variable "user_personal_access_tokens" {
  description = "Manage the lifecycle of a personal access tokens for a specified user."
  type = list(object({
    expires_at = string      // The token expires at midnight UTC on that date. The date must be in the format YYYY-MM-DD.
    name       = string      // The name of the personal access token.
    scopes     = set(string) // The scope for the personal access token. It determines the actions which can be performed when authenticating with this token. Valid values are: api, read_user, read_api, read_repository, write_repository, read_registry, write_registry, sudo, admin_mode, create_runner.
    user_id    = number      // The id of the user.
  }))
  default = []
}


// Projects vars
variable "gitlab_projects" {
  description = "Manage projects"
  type = list(object({
    name                                   = string              // The name of the project.
    allow_merge_on_skipped_pipeline        = optional(bool)      // Set to true if you want to treat skipped pipelines as if they finished with success.
    analytics_access_level                 = optional(string)    // Set the analytics access level. Valid values are disabled, private, enabled
    approvals_before_merge                 = optional(number, 0) // Number of merge request approvals required for merging
    archive_on_destroy                     = optional(bool)      // Set to true to archive the project instead of deleting on destroy. If set to true it will entire omit the DELETE operation.
    archived                               = optional(bool)      // Whether the project is in read-only mode (archived).
    auto_cancel_pending_pipelines          = optional(string)    // Auto-cancel pending pipelines. This isn’t a boolean, but enabled/disabled.
    auto_devops_deploy_strategy            = optional(string)    // Auto Deploy strategy. Valid values are continuous, manual, timed_incremental.
    auto_devops_enabled                    = optional(bool)      // Enable Auto DevOps for this project.
    autoclose_referenced_issues            = optional(bool)      // Set whether auto-closing referenced issues on default branch.
    avatar                                 = optional(string)    // A local path to the avatar image to upload. Note: not available for imported resources.
    avatar_hash                            = optional(string)    // The hash of the avatar image. Use filesha256("path/to/avatar.png") whenever possible. Note: this is used to trigger an update of the avatar. If it's not given, but an avatar is given, the avatar will be updated each time.
    build_git_strategy                     = optional(string)    // The Git strategy. Defaults to fetch. Valid values are clone, fetch.
    build_timeout                          = optional(number)    // The maximum amount of time, in seconds, that a job can run.
    builds_access_level                    = optional(string)    // Set the builds access level. Valid values are disabled, private, enabled.
    ci_config_path                         = optional(string)    //Custom Path to CI config file.
    ci_default_git_depth                   = optional(number)    // Default number of revisions for shallow cloning.
    ci_forward_deployment_enabled          = optional(bool)      // When a new deployment job starts, skip older deployment jobs that are still pending.
    ci_restrict_pipeline_cancellation_role = optional(string)    // The role required to cancel a pipeline or job. Introduced in GitLab 16.8. Premium and Ultimate only. Valid values are developer, maintainer, no one
    ci_separated_caches                    = optional(bool)      // Use separate caches for protected branches.
    container_expiration_policy = optional(list(object({
      cadence           = optional(string)                              // The cadence of the policy. Valid values are: 1d, 7d, 14d, 1month, 3month.
      enabled           = optional(bool)                                // If true, the policy is enabled.
      keep_n            = optional(number)                              // The number of images to keep.
      name_regex_delete = optional(string)                              // The regular expression to match image names to delete.
      name_regex_keep   = optional(string)                              // The regular expression to match image names to keep.
      older_than        = optional(string)                              // The number of days to keep images.
    })))                                                                // Set the image cleanup policy for this project. Note: this field is sometimes named container_expiration_policy_attributes in the GitLab Upstream API. (see below for nested schema)
    container_registry_access_level                  = optional(string) // Set visibility of container registry, for this project. Valid values are disabled, private, enabled.
    default_branch                                   = optional(string) // The default branch for the project.
    description                                      = optional(string) // A description of the project.
    emails_enabled                                   = optional(bool)   // Enable email notifications.
    environments_access_level                        = optional(string) // Set the environments access level. Valid values are disabled, private, enabled.
    external_authorization_classification_label      = optional(string) // The classification label for the project.
    feature_flags_access_level                       = optional(string) // Set the feature flags access level. Valid values are disabled, private, enabled.
    forked_from_project_id                           = optional(number) // The id of the project to fork. During create the project is forked and during an update the fork relation is changed.
    forking_access_level                             = optional(string) // Set the forking access level. Valid values are disabled, private, enabled.
    group_runners_enabled                            = optional(bool)   // Enable group runners for this project.
    group_with_project_templates_id                  = optional(number) // For group-level custom templates, specifies ID of group from which all the custom project templates are sourced. Leave empty for instance-level templates. Requires use_custom_template to be true (enterprise edition).
    import_url                                       = optional(string) // Git URL to a repository to be imported. Together with mirror = true it will setup a Pull Mirror. This can also be used together with forked_from_project_id to setup a Pull Mirror for a fork. The fork takes precedence over the import. Make sure to provide the credentials in import_url_username and import_url_password. GitLab never returns the credentials, thus the provider cannot detect configuration drift in the credentials. They can also not be imported using terraform import. See the examples section for how to properly use it.
    import_url_password                              = optional(string) // The password for the import_url. The value of this field is used to construct a valid import_url and is only related to the provider. This field cannot be imported using terraform import. See the examples section for how to properly use it.
    import_url_username                              = optional(string) // The username for the import_url. The value of this field is used to construct a valid import_url and is only related to the provider. This field cannot be imported using terraform import. See the examples section for how to properly use it.
    infrastructure_access_level                      = optional(string) // Set the infrastructure access level. Valid values are disabled, private, enabled.
    initialize_with_readme                           = optional(bool)   // Create main branch with first commit containing a README.md file.
    issues_access_level                              = optional(string) // Set the issues access level. Valid values are disabled, private, enabled.
    issues_enabled                                   = optional(string) // Enable issue tracking for the project.
    issues_template                                  = optional(string) // Sets the template for new issues in the project.
    keep_latest_artifact                             = optional(bool)   // Disable or enable the ability to keep the latest artifact for this project.
    lfs_enabled                                      = optional(bool)   // Enable LFS for the project.
    merge_commit_template                            = optional(string) // Template used to create merge commit message in merge requests. (Introduced in GitLab 14.5.)
    merge_method                                     = optional(string) // Set the merge method. Valid values are merge, rebase_merge, ff.
    merge_pipelines_enabled                          = optional(bool)   // Enable or disable merge pipelines.
    merge_requests_access_level                      = optional(string) // Set the merge requests access level. Valid values are disabled, private, enabled.
    merge_requests_enabled                           = optional(bool)   // Enable merge requests for the project.
    merge_requests_template                          = optional(string) // Sets the template for new merge requests in the project.
    merge_trains_enabled                             = optional(bool)   // Enable or disable merge trains. Requires merge_pipelines_enabled to be set to true to take effect.
    mirror                                           = optional(bool)   // Enable project pull mirror.
    mirror_overwrites_diverged_branches              = optional(bool)   // Enable overwrite diverged branches for a mirrored project.
    mirror_trigger_builds                            = optional(bool)   // Enable trigger builds on pushes for a mirrored project.
    monitor_access_level                             = optional(string) // Set the monitor access level. Valid values are disabled, private, enabled.
    mr_default_target_self                           = optional(bool)   // For forked projects, target merge requests to this project. If false, the target will be the upstream project.
    namespace_id                                     = optional(number) // The namespace (group or user) of the project. Defaults to your user.
    only_allow_merge_if_all_discussions_are_resolved = optional(bool)   // Set to true if you want allow merges only if all discussions are resolved.
    only_allow_merge_if_pipeline_succeeds            = optional(bool)   // Set to true if you want allow merges only if a pipeline succeeds.
    only_mirror_protected_branches                   = optional(bool)   // Enable only mirror protected branches for a mirrored project.
    packages_enabled                                 = optional(bool)   // Enable packages repository for the project.
    pages_access_level                               = optional(string) // Enable pages access control. Valid values are public, private, enabled, disabled.
    path                                             = optional(string) // The path of the repository.
    printing_merge_request_link_enabled              = optional(bool)   // Show link to create/view merge request when pushing from the command line
    public_jobs                                      = optional(bool)   // If true, jobs can be viewed by non-project members.
    push_rules = optional(list(object({
      author_email_regex            = optional(string)              // All commit author emails must match this regex, e.g. @my-company.com$.
      branch_name_regex             = optional(string)              // All branch names must match this regex, e.g. (feature|hotfix)\/*.
      commit_committer_check        = optional(bool)                // Users can only push commits to this repository that were committed with one of their own verified emails.
      commit_message_negative_regex = optional(string)              // No commit message is allowed to match this regex, for example ssh\:\/\/.
      commit_message_regex          = optional(string)              // All commit messages must match this regex, e.g. Fixed \d+\..*.
    })))                                                            // Push rules for the project. (see below for nested schema)
    releases_access_level                   = optional(string)      // Set the releases access level. Valid values are disabled, private, enabled.
    remove_source_branch_after_merge        = optional(bool)        // Enable Delete source branch option by default for all new merge requests.
    repository_access_level                 = optional(string)      // Set the repository access level. Valid values are disabled, private, enabled.
    repository_storage                      = optional(string)      // Which storage shard the repository is on. (administrator only)
    request_access_enabled                  = optional(bool)        // Allow users to request member access.
    requirements_access_level               = optional(string)      // Set the requirements access level. Valid values are disabled, private, enabled.
    resolve_outdated_diff_discussions       = optional(bool)        // Automatically resolve merge request diffs discussions on lines changed with a push.
    restrict_user_defined_variables         = optional(bool)        // Allow only users with the Maintainer role to pass user-defined variables when triggering a pipeline.
    security_and_compliance_access_level    = optional(string)      // Set the security and compliance access level. Valid values are disabled, private, enabled.
    shared_runners_enabled                  = optional(bool)        // Enable shared runners for this project.
    skip_wait_for_default_branch_protection = optional(bool)        // If true, the default behavior to wait for the default branch protection to be created is skipped. This is necessary if the current user is not an admin and the default branch protection is disabled on an instance-level. There is currently no known way to determine if the default branch protection is disabled on an instance-level for non-admin users. This attribute is only used during resource creation, thus changes are suppressed and the attribute cannot be imported.
    snippets_access_level                   = optional(string)      // Set the snippets access level. Valid values are disabled, private, enabled.
    snippets_enabled                        = optional(bool)        // Enable snippets for the project.
    squash_commit_template                  = optional(string)      // Template used to create squash commit message in merge requests. (Introduced in GitLab 14.6.)
    squash_option                           = optional(string)      // Squash commits when merge request. Valid values are never, always, default_on, or default_off. The default value is default_off. [GitLab >= 14.1]
    suggestion_commit_message               = optional(string)      // The commit message used to apply merge request suggestions.
    tags                                    = optional(set(string)) // The list of tags for a project; put array of tags, that should be finally assigned to a project. Use topics instead.
    template_name                           = optional(string)      // When used without use_custom_template, name of a built-in project template. When used with use_custom_template, name of a custom project template. This option is mutually exclusive with template_project_id.
    template_project_id                     = optional(number)      // When used with use_custom_template, project ID of a custom project template. This is preferable to using template_name since template_name may be ambiguous (enterprise edition). This option is mutually exclusive with template_name. See gitlab_group_project_file_template to set a project as a template project. If a project has not been set as a template, using it here will result in an error.
    timeouts = optional((object({
      create = optional(string)
      delete = optional(string)
    })))
    topics                 = optional(set(string)) // The list of topics for the project.
    use_custom_template    = optional(bool)        // Use either custom instance or group (with group_with_project_templates_id) project template (enterprise edition). ~> When using a custom template, Group Tokens won't work. You must use a real user's Personal Access Token.
    visibility_level       = optional(string)      // Set to public to create a public project. Valid values are private, internal, public.
    wiki_access_level      = optional(string)      // Set the wiki access level. Valid values are disabled, private, enabled.
    wiki_enabled           = optional(bool)        // Enable wiki for the project.
    variables              = optional(any)         // The same as the `project_variables` var (project attr set automaticaly)
    access_tokens          = optional(any)         // Tha same as the `project_access_tokens` var (project attr set automaticaly)
    badges                 = optional(any)         // Tha same as the `project_badges` var (project attr set automaticaly)
    custom_attributes      = optional(any)         // The same as the `project_custom_attributes` var (project attr set automaticaly)
    labels                 = optional(any)         // The same as the `project_labels` var (project attr set automaticaly)
    hooks                  = optional(any)         // The same as the`project_hooks` var (project attr set automaticaly)
    milestones             = optional(any)         // The same as the `project_milestones` var (project attr set automaticaly)
    issue_boards           = optional(any)         // The same as the `project_issue_boards` var (project attr set automaticaly)
    membership             = optional(any)         // The same as the `project_membership` var (project attr set automaticaly)
    mirroring              = optional(any)         // The same as the `project_mirror` var (project attr set automaticaly)
    approval_rules         = optional(any)         // The same as the `project_approval_rules` var (project attr set automaticaly)
    compliance_frameworks  = optional(any)         // The same as the `project_compliance_frameworks` var (project attr set automaticaly)
    environments           = optional(any)         // The same as the `project_environments` var (project attr set automaticaly)
    freeze_period          = optional(any)         // The same as the `project_freeze_period` var (project attr set automaticaly)
    job_token_scopes       = optional(any)         // The same as the `project_job_token_scopes` var (project attr set automaticaly)
    level_mr_approvals     = optional(any)         // The same as the `project_level_mr_approvals` var (project attr set automaticaly)
    runners                = optional(any)         // The same as the `project_runners` var (project attr set automaticaly)
    share_groups           = optional(any)         // The same as the `project_share_groups` var (project attr set automaticaly)
    level_notifications    = optional(any)         // The same as the `project_level_notifications` var (project attr set automaticaly)
    pipeline_schedule      = optional(any)         // The same as the `project_pipeline_schedule` var (project attr set automaticaly)
    protected_environments = optional(any)         // The same as the `project_protected_environments` var (project attr set automaticaly)
    tags                   = optional(any)         // The same as the `project_tags` var (project attr set automaticaly)
    deploy_keys            = optional(any)         // The same as the `project_deploy_keys` var (project attr set automaticaly)
    deploy_tokens          = optional(any)         // The same as the `deploy_tokens` var (project attr set automaticaly)
    pages_domain           = optional(any)         // The same as the `project_pages_domain` var (project attr set automaticaly)
  }))
  default = []
}

variable "project_access_tokens" {
  description = "Resource allows to manage the lifecycle of a project access token."
  type = list(object({
    name         = string           // The name of the project access token.
    project      = string           // The ID or full path of the project
    scopes       = set(string)      // The scopes of the project access token.
    access_level = optional(string) // The access level for the project access token.
    expires_at   = optional(string) // When the token will expire, YYYY-MM-DD format. Is automatically set when rotation_configuration is used.
    rotation_configuration = optional(object({
      expiration_days    = number // The duration (in days) the new token should be valid for.
      rotate_before_days = number // The duration (in days) before the expiration when the token should be rotated.
    }))                           //  The configuration for when to rotate a token automatically. 
  }))
  default = []
}

variable "project_approval_rules" {
  description = "Manage the lifecycle of a project-level approval rule."
  type = list(object({
    name                                                  = string
    project                                               = string
    approvals_required                                    = number
    approvals_required                                    = optional(bool, false)       // Whether the rule is applied to all protected branches. If set to 'true', the value of protected_branch_ids is ignored
    disable_importing_default_any_approver_rule_on_create = optional(bool)              // When this flag is set, the default any_approver rule will not be imported if present.
    group_ids                                             = optional(set(number))       // A list of group IDs whose members can approve of the merge request.
    protected_branch_ids                                  = optional(set(number))       // A list of protected branch IDs (not branch names) for which the rule applies.
    rule_type                                             = optional(string, "regular") // The type of rule.
    user_ids                                              = optional(set(number))       // A list of specific User IDs to add to the list of approvers.
  }))
  default = []
}

variable "project_badges" {
  description = "Manage the lifecycle of project badges"
  type = list(object({
    project   = string           // The id of the project to add the badge to.
    image_url = string           // The image url which will be presented on project overview.
    link_url  = string           // The url linked with the badge.
    name      = optional(string) // The name of the badge.
  }))
  default = []
}

variable "project_compliance_framework" {
  description = "Manage the lifecycle of a compliance framework on a project."
  type = list(object({
    compliance_framework_id = string // Globally unique ID of the compliance framework to assign to the project.
    project                 = string // The ID or full path of the project to change the compliance framework of.
  }))
  default = []
}

variable "project_custom_attributes" {
  description = "Manage custom attributes for a project."
  type = list(object({
    project = string // The id of the project.
    key     = string // Key for the Custom Attribute.
    value   = string // Value for the Custom Attribute.
  }))
  default = []
}

variable "project_environments" {
  description = "Manage the lifecycle of an environment in a project."
  type = list(object({
    name                = string           // The name of the environment.
    project             = string           // The ID or full path of the project to environment is created for.
    external_url        = optional(string) // Place to link to for this environment.
    stop_before_destroy = optional(string) // Determines whether the environment is attempted to be stopped before the environment is deleted.
  }))
  default = []
}

variable "project_freeze_period" {
  description = "Manage the lifecycle of a freeze period for a project."
  type = object({
    freeze_end    = string           // End of the Freeze Period in cron format (e.g. 0 2 * * *)
    freeze_start  = string           // Start of the Freeze Period in cron format (e.g. 0 1 * * *)
    project       = string           // The ID or URL-encoded path of the project to add the schedule to.
    cron_timezone = optional(string) // The timezone.
  })
  default = {}
}

variable "project_hooks" {
  description = "Manage the lifecycle of a project hook."
  type = list(object({
    project                    = string           // The name or id of the project to add the hook to.
    url                        = string           // The url of the hook to invoke.
    confidential_issues_events = optional(bool)   // Invoke the hook for confidential issues events.
    confidential_note_events   = optional(bool)   // Invoke the hook for confidential notes events.
    custom_webhook_template    = optional(bool)   // Set a custom webhook template.
    deployment_events          = optional(bool)   // Invoke the hook for deployment events.
    enable_ssl_verification    = optional(bool)   // Enable ssl verification when invoking the hook.
    issues_events              = optional(bool)   //Invoke the hook for issues events.
    job_events                 = optional(bool)   //  Invoke the hook for job events.
    merge_requests_events      = optional(bool)   // Invoke the hook for merge requests.
    note_events                = optional(bool)   //  Invoke the hook for notes events.
    pipeline_events            = optional(bool)   // Invoke the hook for pipeline events.
    push_events                = optional(bool)   // Invoke the hook for push events.
    push_events_branch_filter  = optional(bool)   // Invoke the hook for push events on matching branches only.
    releases_events            = optional(bool)   // Invoke the hook for releases events.
    tag_push_events            = optional(bool)   // Invoke the hook for tag push events.
    token                      = optional(string) // A token to present when invoking the hook. The token is not available for imported resources.
    wiki_page_events           = optional(bool)   // Invoke the hook for wiki page events.
  }))
  default = []
}

variable "project_milestones" {
  description = "Manage the lifecycle of a project milestone."
  type = list(object({
    project     = string           // The ID or URL-encoded path of the project owned by the authenticated user.
    title       = string           // The title of a milestone.
    description = optional(string) // The description of the milestone.
    due_date    = optional(string) // The due date of the milestone. Date time string in the format YYYY-MM-DD
    start_date  = optional(string) // The start date of the milestone. Date time string in the format YYYY-MM-DD
    state       = optional(string) // The state of the milestone.
  }))
  default = []
}

variable "project_issues" {
  description = "Manage the lifecycle of an issue within a project."
  type = list(object({
    project                                 = string                // The name or ID of the project.
    title                                   = string                // The title of the issue.
    assignee_ids                            = optional(set(number)) // The IDs of the users to assign the issue to.
    confidential                            = optional(bool)        // Set an issue to be confidential.
    created_at                              = optional(string)      // When the issue was created. Date time string, ISO 8601 formatted, for example 2016-03-11T03:45:40Z.
    delete_on_destroy                       = optional(bool)        // Whether the issue is deleted instead of closed during destroy.
    description                             = optional(string)      // The description of an issue. Limited to 1,048,576 characters.
    discussion_locked                       = optional(bool)        // Whether the issue is locked for discussions or not.
    discussion_to_resolve                   = optional(string)      // The ID of a discussion to resolve.
    due_date                                = optional(string)      // The due date. Date time string in the format YYYY-MM-DD
    epic_issue_id                           = optional(number)      // The ID of the epic issue.
    iid                                     = optional(number)      // The internal ID of the project's issue.
    issue_type                              = optional(string)      // The type of issue. Valid values are: issue, incident, test_case.
    labels                                  = optional(set(string)) // The labels of an issue.
    merge_request_to_resolve_discussions_of = optional(number)      //  The IID of a merge request in which to resolve all issues. 
    milestone_id                            = optional(number)      // The global ID of a milestone to assign issue. 
    state                                   = optional(string)      // The state of the issue. Valid values are: opened, closed.
    updated_at                              = optional(string)      // When the issue was updated. Date time string, ISO 8601 formatted, for example 2016-03-11T03:45:40Z.
    weight                                  = optional(number)      // The weight of the issue. Valid values are greater than or equal to 0.
  }))
  default = []
}

variable "project_issue_boards" {
  description = "Manage the lifecycle of a Project Issue Board."
  type = list(object({
    name        = string                // The name of the board.
    project     = string                // The ID or full path of the project maintained by the authenticated user.
    assignee_id = optional(number)      // The assignee the board should be scoped to. Requires a GitLab EE license.
    labels      = optional(set(string)) // The list of label names which the board should be scoped to. Requires a GitLab EE license.
    lists = optional(list(object({
      assignee_id  = optional(number) // The assignee the board should be scoped to. Requires a GitLab EE license.
      iteration_id = optional(number) // The ID of the iteration the list should be scoped to. Requires a GitLab EE license.
      label_id     = optional(number) // The ID of the label the list should be scoped to. Requires a GitLab EE license.
      milestone_id = optional(number) // The ID of the milestone the list should be scoped to. Requires a GitLab EE license.
    })))                              // The list of issue board lists
    milestone_id = optional(number)   // The milestone the board should be scoped to. Requires a GitLab EE license.
    weight       = optional(number)   // The weight range from 0 to 9, to which the board should be scoped to. Requires a GitLab EE license.
  }))
  default = []
}

variable "project_job_token_scopes" {
  description = "Manage the CI/CD Job Token scope in a project."
  type = list(object({
    project           = string // The ID or full path of the project.
    target_project_id = number // The ID of the project that is in the CI/CD job token inbound allowlist.
  }))
  default = []
}

variable "project_labels" {
  description = "Manage the lifecycle of a project label."
  type = list(object({
    color       = string           // The color of the label given in 6-digit hex notation with leading '#' sign (e.g. #FFAABB) or one of the CSS color names.
    name        = string           // The name of the label.
    project     = string           // The name or id of the project to add the label to.
    description = optional(string) // The description of the label.
  }))
  default = []
}

###

variable "project_level_mr_approvals" {
  description = "Manage the lifecycle of a Merge Request-level approval rule."
  type = object({
    project                                        = string               // The ID or URL-encoded path of a project to change MR approval configuration.
    disable_overriding_approvers_per_merge_request = optional(bool)       // Set to true to disable overriding approvers per merge request.
    merge_requests_author_approval                 = optional(bool)       // Set to true to allow merge requests authors to approve their own merge requests.
    merge_requests_disable_committers_approval     = optional(bool)       // Set to true to disable merge request committers from approving their own merge requests.
    require_password_to_approve                    = optional(bool)       // Set to true to require authentication to approve merge requests.
    reset_approvals_on_push                        = optional(bool, true) // Set to true to remove all approvals in a merge request when new commits are pushed to its source branch.
    selective_code_owner_removals                  = optional(bool)       // Reset approvals from Code Owners if their files changed.
  })
  default = {}
}

variable "project_level_notifications" {
  description = "Manage notifications for a project"
  type = object({
    project                      = string           // The ID or URL-encoded path of a project where notifications will be configured.
    close_issue                  = optional(bool)   // Enable notifications for closed issues. Can only be used when level is custom.
    close_merge_request          = optional(bool)   // Enable notifications for closed merge requests. Can only be used when level is custom.
    failed_pipeline              = optional(bool)   // Enable notifications for failed pipelines. Can only be used when level is custom
    fixed_pipeline               = optional(bool)   // Enable notifications for fixed pipelines. Can only be used when level is custom
    issue_due                    = optional(bool)   // Enable notifications for due issues. Can only be used when level is custom.
    level                        = optional(string) // The level of the notification. Valid values are: disabled, participating, watch, global, mention, custom
    merge_merge_request          = optional(bool)   // Enable notifications for merged merge requests. Can only be used when level is custom.
    merge_when_pipeline_succeeds = optional(bool)   // Enable notifications for merged merge requests when the pipeline succeeds. Can only be used when level is custom.
    moved_project                = optional(bool)   // Enable notifications for moved projects. Can only be used when level is custom.
    new_issue                    = optional(bool)   // Enable notifications for new issues. Can only be used when level is custom.
    new_merge_request            = optional(bool)   // Enable notifications for new merge requests. Can only be used when level is custom.
    new_note                     = optional(bool)   // Enable notifications for new notes on merge requests. Can only be used when level is custom
    push_to_merge_request        = optional(bool)   // Enable notifications for push to merge request branches. Can only be used when level is custom.
    reassign_issue               = optional(bool)   // Enable notifications for issue reassignments. Can only be used when level is custom
    reassign_merge_request       = optional(bool)   // Enable notifications for merge request reassignments. Can only be used when level is custom.
    reopen_issue                 = optional(bool)   // Enable notifications for reopened issues. Can only be used when level is custom.
    reopen_merge_request         = optional(bool)   // Enable notifications for reopened merge requests. Can only be used when level is custom.
    success_pipeline             = optional(bool)   // Enable notifications for successful pipelines. Can only be used when level is custom.
  })
  default = {}
}

variable "project_membership" {
  description = "Manage the lifecycle of a users project membership."
  type = list(object({
    access_level = string           // The access level for the member. Valid values are: no one, minimal, guest, reporter, developer, maintainer, owner, master
    project      = string           // The ID or URL-encoded path of the project.
    user_id      = number           // The id of the user.
    expires_at   = optional(string) // Expiration date for the project membership. Format: YYYY-MM-DD
  }))
  default = []
}

variable "project_mirror" {
  description = "Manage the lifecycle of a project mirror."
  type = object({
    project                 = string         // The id of the project.
    url                     = string         // The URL of the remote repository to be mirrored.
    enabled                 = optional(bool) // Determines if the mirror is enabled.
    keep_divergent_refs     = optional(bool) // Determines if divergent refs are skipped.
    only_protected_branches = optional(bool) // Determines if only protected branches are mirrored.
  })
  default = {}
}

variable "project_protected_environments" {
  description = "Manage the lifecycle of a protected environment in a project."
  type = list(object({
    environment = string // The name of the environment.
    project     = string // The ID or full path of the project which the protected environment is created against.
    approval_rules = optional(list(object({
      access_level           = optional(string)    // Levels of access allowed to approve a deployment to this protected environment. Valid values are developer, maintainer.
      group_id               = optional(string)    // The ID of the group allowed to approve a deployment to this protected environment.
      group_inheritance_type = optional(number, 0) // Group inheritance allows deploy access levels to take inherited group membership into account. Valid values are 0, 1. 0 => Direct group membership only, 1 => All inherited groups. Default: 0
      required_approvals     = optional(number)    // The number of approval required to allow deployment to this protected environment. This is mutually exclusive with user_id.
      user_id                = optional(number)    // The ID of the user allowed to approve a deployment to this protected environment. The user must be a member of the project. This is mutually exclusive with group_id and required_approvals.
    })))                                           // Array of approval rules to deploy, with each described by a hash.
    deploy_access_levels = optional(set(object({
      access_level           = optional(string)    // Levels of access required to deploy to this protected environment. Valid values are developer, maintainer.
      group_id               = optional(number)    // The ID of the group allowed to deploy to this protected environment. The project must be shared with the group.
      group_inheritance_type = optional(number, 0) // Group inheritance allows deploy access levels to take inherited group membership into account. Valid values are 0, 1. 0 => Direct group membership only, 1 => All inherited groups. Default: 0
      user_id                = optional(number)    // The ID of the user allowed to deploy to this protected environment. The user must be a member of the project.
    })))                                           // Array of access levels allowed to deploy, with each described by a hash.
    required_approval_count = optional(number)     // The number of approvals required to deploy to this environment.
  }))
  default = []
}

variable "project_runners" {
  description = "Enable a runner in a project."
  type = list(object({
    project   = string // The ID or URL-encoded path of the project owned by the authenticated user.
    runner_id = number // The ID of a runner to enable for the project.
  }))
  default = []
}

variable "project_share_groups" {
  description = "Manage the lifecycle of project shared with a group."
  type = list(object({
    group_id     = number           // The id of the group.
    project      = string           // The ID or URL-encoded path of the project.
    group_access = optional(string) // The access level to grant the group for the project. Valid values are: no one, minimal, guest, reporter, developer, maintainer, owner, master
  }))
  default = []
}

variable "project_tags" {
  description = "Manage the lifecycle of a tag in a project."
  type = list(object({
    name    = string           // The name of a tag.
    project = string           // The ID or URL-encoded path of the project owned by the authenticated user.
    ref     = string           // Create tag using commit SHA, another tag name, or branch name. This attribute is not available for imported resources.
    message = optional(string) // The message of the annotated tag.
  }))
  default = []
}

variable "project_variables" {
  description = "Manage the lifecycle of a CI/CD variable for a project."
  type = list(object({
    key               = string                      // The name of the variable.
    project           = string                      // The name or id of the project.
    value             = string                      // The value of the variable.
    description       = optional(string)            // The description of the variable.
    environment_scope = optional(string)            // The environment scope of the variable. Defaults to all environment (*). Note that in Community Editions of Gitlab, values other than * will cause inconsistent plans.
    masked            = optional(bool, false)       //  If set to true, the value of the variable will be hidden in job logs. The value must meet the masking requirements.
    protected         = optional(bool, false)       // If set to true, the variable will be passed only to pipelines running on protected branches and tags.
    raw               = optional(bool, false)       // Whether the variable is treated as a raw string. When true, variables in the value are not expanded.
    variable_type     = optional(string, "env_var") // The type of a variable. Valid values are: env_var, file
  }))
  default = []
}

variable "project_deploy_keys" {
  description = "Configiure the lifecycle of a deploy key."
  type = list(object({
    key      = string                // The public ssh key body.
    project  = string                // The name or id of the project to add the deploy key to.
    title    = string                // A title to describe the deploy key with.
    can_push = optional(bool, false) // Allow this deploy key to be used to push changes to the project. 
  }))
  default = []
}

variable "deploy_tokens" {
  description = "Set configuration of the lifecycle of group and project deploy tokens."
  type = list(object({
    name       = string           // A name to describe the deploy token with.
    scopes     = set(string)      // Valid values: read_repository, read_registry, read_package_registry, write_registry, write_package_registry.
    expires_at = optional(string) // Time the token will expire it, RFC3339 format. Will not expire per default.
    group      = optional(string) // The name or id of the group to add the deploy token to.
    project    = optional(string) // The name or id of the project to add the deploy token to.
    username   = optional(string) // A username for the deploy token. Default is gitlab+deploy-token-{n}.
  }))
  default = []
}

variable "project_pipeline_schedule" {
  description = "Configure the lifecycle of a scheduled pipeline."
  type = list(object({
    cron           = string           // The cron (e.g. 0 1 * * *).
    description    = string           // The description of the pipeline schedule.
    project        = string           // The name or id of the project to add the schedule to.
    ref            = string           // The branch/tag name to be triggered.
    active         = optional(bool)   // The activation of pipeline schedule. If false is set, the pipeline schedule will deactivated initially.
    cron_timezone  = optional(string) // The timezone.
    take_ownership = optional(bool)   // When set to true, the user represented by the token running Terraform will take ownership of the scheduled pipeline prior to editing it.
    variable = optional(list(object({
      key   = string // Name of the variable.
      value = string // Value of the variable.
    })))
  }))
  default = []
}

variable "project_pages_domain" {
  description = ""
  type = object({
    domain           = string           // The custom domain indicated by the user.
    project          = string           // The ID or URL-encoded path of the project owned by the authenticated user.
    auto_ssl_enabled = optional(bool)   //  Enables automatic generation of SSL certificates issued by Let’s Encrypt for custom domains. When this is set to "true", certificate can't be provided.
    certificate      = optional(string) // The certificate in PEM format with intermediates following in most specific to least specific order.
    expired          = optional(bool)   // Whether the certificate is expired.
    key              = optional(string) //The certificate key in PEM format.
  })
  default = {}
}

/*
variable "" {
  description = ""
  type = list(object({
  }))
  default = []
}
*/