# Terrafrom gitlab module

This module is umbrella over another terraform gitlab modules:
- [terraform-module-gitlab-group](https://github.com/saydulaev/terraform-module-gitlab-group.git)
- [terraform-module-gitlab-project](https://github.com/saydulaev/terraform-module-gitlab-project.git)
- [terraform-module-gitlab-user](https://github.com/saydulaev/terraform-module-gitlab-user.git)
- [terraform-module-gitlab-instance](https://github.com/saydulaev/terraform-module-gitlab-instance.git)

It let you configure Gitlab resources like, [users](https://github.com/saydulaev/terraform-module-gitlab-user/blob/main/README.md), [groups](https://github.com/saydulaev/terraform-module-gitlab-group/blob/main/README.md), [projects](https://github.com/saydulaev/terraform-module-gitlab-project/blob/main/README.md) and some [instance resources](https://github.com/saydulaev/terraform-module-gitlab-instance/blob/main/README.md).

To make an initial configuration of the new Gitlab instance use the gitlab.yml config file. The entities into config file are logical splitted by their purposes, like `groups` which contains all groups with additional resources such as `deploy_tokens`, `labels`, `epic_boards` and so on.

> Project supports [Devbox](https://github.com/jetify-com/devbox) and [Taskfile](https://github.com/go-task/task)
```bash
git clone git@github.com:saydulaev/terraform-module-gitlab.git
cd terraform-module-gitlab
devbox shell
task -l -y
task "checkov --download-external-modules true --skip-check CKV_GLB_3,CKV_GLB_1,CKV_GLB_4"
task trivy

# Run gitlab instance. All configuration located into examples/docker directory
task docker-compose-up
# Then go to gitlab web ui and create the Personal access token with scope 'api'
export GITLAB_TOKEN=<GITLAB_PERSONAL_ACCESS_TOKEN>
task terraform-plan
task terraform-apply
task terraform-destroy
task docker-compose-down
```

> Each child module has two types of almost all variables except vars of resources that does not suppose to use it multiple time. Array (plural) and object. Like example `share_groups` and `share_group`. The main reason to made me implemented this was that some time you will able to face with [for_each issue](https://github.com/hashicorp/terraform/issues/30838). To get around this issue, module lets you use a single object var. Respectively plural and object resources have their own defined outputs.

In example below call module that includes all resources variables belong to group.
```hcl
module "gitlab_group" {
  source = "github.com/saydulaev/terraform-module-gitlab-group"
  for_each = local.parent_groups

  tier = var.tier
  group = {
    name                               = each.value.name
    path                               = each.value.path
    ...
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
}
```

Also it is possible to set up only one resource, like example:
```hcl
module "gitlab_group_share_test" {
  source = "github.com/saydulaev/terraform-module-gitlab-group"

  share_groups = [
    {
      share_group_id = "test"
      group_id       = "devops"
      group_access   = "reporter"
    }
  ]

  depends_on = [
    module.gitlab_group_test,
    module.gitlab_group_devops
  ]
}
```

or use single object resource

```hcl
module "gitlab_user" {
  source = "github.com/saydulaev/terraform-module-gitlab-user"

  user = {
    email             = "user@example.local"
    name              = "User name"
    username          = "user"
    ...
  }
}

resource "tls_private_key" "user" {
  algorithm = "ED25519"
}

module "gitlab_user_ssh" {
  source = "github.com/saydulaev/terraform-module-gitlab-user"

  sshkey = {
    key     = tls_private_key.user.public_key_openssh
    title   = "User name"
    user_id = "user" // or module.gitlab_user.id
  }
}
```


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | 16.11.0 |
| <a name="requirement_gpg"></a> [gpg](#requirement\_gpg) | >= 0.2.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | 16.11.0 |
| <a name="provider_gpg"></a> [gpg](#provider\_gpg) | 0.2.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_add_membership"></a> [add\_membership](#module\_add\_membership) | github.com/saydulaev/terraform-module-gitlab-project | ec70db2f9874c7e4243bdd88aa05b7a771e4d125 |
| <a name="module_gitlab_group"></a> [gitlab\_group](#module\_gitlab\_group) | github.com/saydulaev/terraform-module-gitlab-group | eecb38c0cbc3376ed0a0e891b368fbdc9bf35634 |
| <a name="module_gitlab_group_2_tier"></a> [gitlab\_group\_2\_tier](#module\_gitlab\_group\_2\_tier) | github.com/saydulaev/terraform-module-gitlab-group | eecb38c0cbc3376ed0a0e891b368fbdc9bf35634 |
| <a name="module_gitlab_group_3_tier"></a> [gitlab\_group\_3\_tier](#module\_gitlab\_group\_3\_tier) | github.com/saydulaev/terraform-module-gitlab-group | eecb38c0cbc3376ed0a0e891b368fbdc9bf35634 |
| <a name="module_gitlab_group_share_test"></a> [gitlab\_group\_share\_test](#module\_gitlab\_group\_share\_test) | github.com/saydulaev/terraform-module-gitlab-group | eecb38c0cbc3376ed0a0e891b368fbdc9bf35634 |
| <a name="module_gitlab_instance"></a> [gitlab\_instance](#module\_gitlab\_instance) | github.com/saydulaev/terraform-module-gitlab-instance | bcbac441fddc96945d62b37f7b03a0477ce2388b |
| <a name="module_gitlab_project"></a> [gitlab\_project](#module\_gitlab\_project) | github.com/saydulaev/terraform-module-gitlab-project | ec70db2f9874c7e4243bdd88aa05b7a771e4d125 |
| <a name="module_gitlab_project_example_integration_slack"></a> [gitlab\_project\_example\_integration\_slack](#module\_gitlab\_project\_example\_integration\_slack) | github.com/saydulaev/terraform-module-gitlab-project | ec70db2f9874c7e4243bdd88aa05b7a771e4d125 |
| <a name="module_gitlab_project_example_vars"></a> [gitlab\_project\_example\_vars](#module\_gitlab\_project\_example\_vars) | github.com/saydulaev/terraform-module-gitlab-project | ec70db2f9874c7e4243bdd88aa05b7a771e4d125 |
| <a name="module_gitlab_user"></a> [gitlab\_user](#module\_gitlab\_user) | github.com/saydulaev/terraform-module-gitlab-user | e850cde4207bf30f702d75ca126575989bd274c9 |
| <a name="module_gitlab_user1_gpg"></a> [gitlab\_user1\_gpg](#module\_gitlab\_user1\_gpg) | github.com/saydulaev/terraform-module-gitlab-user | e850cde4207bf30f702d75ca126575989bd274c9 |
| <a name="module_gitlab_user1_ssh"></a> [gitlab\_user1\_ssh](#module\_gitlab\_user1\_ssh) | github.com/saydulaev/terraform-module-gitlab-user | e850cde4207bf30f702d75ca126575989bd274c9 |
| <a name="module_gitlab_user2_gpg"></a> [gitlab\_user2\_gpg](#module\_gitlab\_user2\_gpg) | github.com/saydulaev/terraform-module-gitlab-user | e850cde4207bf30f702d75ca126575989bd274c9 |
| <a name="module_gitlab_user2_ssh"></a> [gitlab\_user2\_ssh](#module\_gitlab\_user2\_ssh) | github.com/saydulaev/terraform-module-gitlab-user | e850cde4207bf30f702d75ca126575989bd274c9 |
| <a name="module_gitlab_user2_token"></a> [gitlab\_user2\_token](#module\_gitlab\_user2\_token) | github.com/saydulaev/terraform-module-gitlab-user | e850cde4207bf30f702d75ca126575989bd274c9 |

## Resources

| Name | Type |
|------|------|
| [gpg_private_key.user1](https://registry.terraform.io/providers/Olivr/gpg/latest/docs/resources/private_key) | resource |
| [gpg_private_key.user2](https://registry.terraform.io/providers/Olivr/gpg/latest/docs/resources/private_key) | resource |
| [tls_private_key.ssh_user1](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_private_key.ssh_user2](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [gitlab_groups.exists_groups](https://registry.terraform.io/providers/gitlabhq/gitlab/16.11.0/docs/data-sources/groups) | data source |
| [gitlab_metadata.this](https://registry.terraform.io/providers/gitlabhq/gitlab/16.11.0/docs/data-sources/metadata) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tier"></a> [tier](#input\_tier) | Define your Gitlab tier to activate premium and ultimate features | `string` | `"free"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gitlab_metadata"></a> [gitlab\_metadata](#output\_gitlab\_metadata) | Gitlab metadata |
| <a name="output_groups_access_tokens_id"></a> [groups\_access\_tokens\_id](#output\_groups\_access\_tokens\_id) | Gitlab groups access tokens id |
| <a name="output_groups_custom_attributes"></a> [groups\_custom\_attributes](#output\_groups\_custom\_attributes) | Gitlab groups custom attributes |
| <a name="output_groups_epic_boards_id"></a> [groups\_epic\_boards\_id](#output\_groups\_epic\_boards\_id) | Gitlab groups epic boards id |
| <a name="output_groups_full_name"></a> [groups\_full\_name](#output\_groups\_full\_name) | Gitlab groups full name |
| <a name="output_groups_full_path"></a> [groups\_full\_path](#output\_groups\_full\_path) | Gitlab groups full path |
| <a name="output_groups_id"></a> [groups\_id](#output\_groups\_id) | Gitlab groups id |
| <a name="output_groups_issue_boards_id"></a> [groups\_issue\_boards\_id](#output\_groups\_issue\_boards\_id) | Gitlab groups issue boards id |
| <a name="output_groups_ldap_link"></a> [groups\_ldap\_link](#output\_groups\_ldap\_link) | Gitlab groups ldap link id |
| <a name="output_groups_membership_id"></a> [groups\_membership\_id](#output\_groups\_membership\_id) | Gitlab groups membership id |
| <a name="output_groups_protected_environments"></a> [groups\_protected\_environments](#output\_groups\_protected\_environments) | Gitlab groups protected environments id |
| <a name="output_groups_saml_link_id"></a> [groups\_saml\_link\_id](#output\_groups\_saml\_link\_id) | Gitlab groups saml link id |
| <a name="output_groups_share_group_id"></a> [groups\_share\_group\_id](#output\_groups\_share\_group\_id) | Gitlab groups share group id |
| <a name="output_instance_applications"></a> [instance\_applications](#output\_instance\_applications) | Gitlab instance apps full outcome |
| <a name="output_instance_hooks_id"></a> [instance\_hooks\_id](#output\_instance\_hooks\_id) | Gitlab system hooks |
| <a name="output_instance_topics"></a> [instance\_topics](#output\_instance\_topics) | Gitlab topics |
| <a name="output_instance_variables_id"></a> [instance\_variables\_id](#output\_instance\_variables\_id) | Gitlab instance variables id |
| <a name="output_project_integration_custom_issue_tracker"></a> [project\_integration\_custom\_issue\_tracker](#output\_project\_integration\_custom\_issue\_tracker) | Gitlab project custom integration issue tracker |
| <a name="output_project_integration_emails_on_push"></a> [project\_integration\_emails\_on\_push](#output\_project\_integration\_emails\_on\_push) | Gitlab project custom email on push service |
| <a name="output_project_integration_external_wiki"></a> [project\_integration\_external\_wiki](#output\_project\_integration\_external\_wiki) | Gitlab project external wiki |
| <a name="output_project_integration_github"></a> [project\_integration\_github](#output\_project\_integration\_github) | Gitlab project Github intergation |
| <a name="output_project_integration_jira"></a> [project\_integration\_jira](#output\_project\_integration\_jira) | Gitlab project Jira intergration |
| <a name="output_project_integration_mattermost_id"></a> [project\_integration\_mattermost\_id](#output\_project\_integration\_mattermost\_id) | Gitlab project Mattermost integration |
| <a name="output_project_integration_microsoft_teams"></a> [project\_integration\_microsoft\_teams](#output\_project\_integration\_microsoft\_teams) | Gitlab project Microsoft Teams integration |
| <a name="output_project_integration_pipelines_email_id"></a> [project\_integration\_pipelines\_email\_id](#output\_project\_integration\_pipelines\_email\_id) | Gitlab project pipeline email integration |
| <a name="output_project_integration_slack_id"></a> [project\_integration\_slack\_id](#output\_project\_integration\_slack\_id) | Gitlab project Slack integration id |
| <a name="output_projects"></a> [projects](#output\_projects) | Gitlab projects full object list |
| <a name="output_projects_id"></a> [projects\_id](#output\_projects\_id) | Gitlab projects id |
| <a name="output_users_gpgkeys_id"></a> [users\_gpgkeys\_id](#output\_users\_gpgkeys\_id) | Gitlab users gpg keys id |
| <a name="output_users_gpgkeys_key_id"></a> [users\_gpgkeys\_key\_id](#output\_users\_gpgkeys\_key\_id) | Gitlab users gpg keys key id |
| <a name="output_users_id"></a> [users\_id](#output\_users\_id) | Gitlab users id |
| <a name="output_users_sshkeys_id"></a> [users\_sshkeys\_id](#output\_users\_sshkeys\_id) | Gitlab users ssh keys id |
| <a name="output_users_sshkeys_key_id"></a> [users\_sshkeys\_key\_id](#output\_users\_sshkeys\_key\_id) | Gitlab users ssh keys key id |
<!-- END_TF_DOCS -->