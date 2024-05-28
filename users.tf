locals {
  users = length(local.gitlab_users) > 0 ? [for user in local.gitlab_users :
    merge(
      {
        email             = user.email
        name              = user.name
        username          = user.username
        can_create_group  = try(user.can_create_group, false)
        is_admin          = try(user.is_admin, false)
        is_external       = try(user.is_external, false)
        namespace_id      = try(user.namespace_id, null)
        note              = try(user.note, null)
        password          = try(user.password, null)
        projects_limit    = try(user.projects_limit, null)
        reset_password    = try(user.reset_password, null)
        skip_confirmation = try(user.skip_confirmation, null)
        state             = try(user.state, null)
        custom_attributes = length(try(user.custom_attributes, [])) > 0 ? [
          for attr in user.custom_attributes : merge({
            user  = try(user.name, user)
            key   = attr.key
            value = try(attr.value, "")
          })
        ] : []
        gpgkeys = length(try(user.gpgkeys, [])) > 0 ? [
          for gpg in user.gpgkeys : merge({
            user_id = lower(try(user.name, user))
            key     = gpg.key
          })
        ] : []
        sshkeys = length(try(user.sshkeys, [])) > 0 ? [
          for ssh in user.sshkeys : merge({
            user_id    = lower(try(user.name, user))
            key        = ssh.key
            title      = ssh.title
            expires_at = try(ssh.expires_at, null)
          })
        ] : []
        access_tokens = length(try(user.access_tokens, [])) > 0 ? [
          for token in user.access_tokens : merge({
            name       = token.name
            scopes     = token.scopes
            user_id    = try(user.name, user)
            expires_at = token.expires_at
          })
        ] : []
      }
    )
  ] : []
}

module "gitlab_user" {
  source = "github.com/saydulaev/terraform-module-gitlab-user?ref=e850cde4207bf30f702d75ca126575989bd274c9"
  for_each = { for user in local.users : user.username => user }

  user = {
    email             = each.value.email
    name              = each.value.name
    username          = each.value.username
    can_create_group  = each.value.can_create_group
    is_admin          = each.value.is_admin
    is_external       = each.value.is_external
    namespace_id      = each.value.namespace_id
    note              = each.value.note
    password          = each.value.password
    projects_limit    = each.value.projects_limit
    reset_password    = each.value.reset_password
    skip_confirmation = each.value.skip_confirmation
    state             = each.value.state
  }

  custom_attributes = each.value.custom_attributes
  gpgkeys           = each.value.gpgkeys
  sshkeys           = each.value.sshkeys
  access_tokens     = each.value.access_tokens
}

resource "tls_private_key" "ssh_user1" {
  algorithm = "ED25519"
}

resource "tls_private_key" "ssh_user2" {
  algorithm = "ED25519"
}

module "gitlab_user1_ssh" {
  source = "github.com/saydulaev/terraform-module-gitlab-user?ref=e850cde4207bf30f702d75ca126575989bd274c9"

  sshkey = {
    key     = tls_private_key.ssh_user1.public_key_openssh
    title   = "User 1"
    user_id = "User1"
  }
  depends_on = [
    module.gitlab_user,
    tls_private_key.ssh_user1,
  ]
}

module "gitlab_user2_ssh" {
  source = "github.com/saydulaev/terraform-module-gitlab-user?ref=e850cde4207bf30f702d75ca126575989bd274c9"

  sshkey = {
    key     = tls_private_key.ssh_user2.public_key_openssh
    title   = "User 2"
    user_id = "User2"
  }
  depends_on = [
    module.gitlab_user,
    tls_private_key.ssh_user2
  ]
}

resource "gpg_private_key" "user1" {
  name       = "User1"
  email      = "user1@example.local"
  passphrase = "this is not a secure passphrase"
  rsa_bits   = 3072
}

resource "gpg_private_key" "user2" {
  name       = "User2"
  email      = "user2@example.local"
  passphrase = "this is not a secure passphrase"
  rsa_bits   = 3072
}

module "gitlab_user1_gpg" {
  source = "github.com/saydulaev/terraform-module-gitlab-user?ref=e850cde4207bf30f702d75ca126575989bd274c9"

  gpgkey = {
    key     = gpg_private_key.user1.public_key
    user_id = "User1"
  }

  depends_on = [
    module.gitlab_user,
    gpg_private_key.user1
  ]
}

module "gitlab_user2_gpg" {
  source = "github.com/saydulaev/terraform-module-gitlab-user?ref=e850cde4207bf30f702d75ca126575989bd274c9"

  gpgkey = {
    key     = gpg_private_key.user2.public_key
    user_id = "User2"
  }

  depends_on = [
    module.gitlab_user,
    gpg_private_key.user2
  ]
}

module "gitlab_user2_token" {
  source = "github.com/saydulaev/terraform-module-gitlab-user?ref=e850cde4207bf30f702d75ca126575989bd274c9"

  access_token = {
    name       = "token1"
    scopes     = ["read_registry"]
    user_id    = "User2"
    expires_at = "2024-10-10"
  }

  depends_on = [
    module.gitlab_user,
  ]
}

module "add_membership" {
  source = "github.com/saydulaev/terraform-module-gitlab-project?ref=ec70db2f9874c7e4243bdd88aa05b7a771e4d125"

  memberships = [
    {
      access_level = "developer"
      project      = "example"
      user_id = "User1"
    },
    {
      access_level = "maintainer"
      project      = "example"
      user_id = "User2"
    },
  ]

  depends_on = [
    module.gitlab_project,
    module.gitlab_user
  ]
}