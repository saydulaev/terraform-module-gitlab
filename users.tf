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
            user_id = try(user.name, user)
            key     = gpg.key
          })
        ] : []
        sshkeys = length(try(user.sshkeys, [])) > 0 ? [
          for ssh in user.sshkeys : merge({
            user_id    = try(user.name, user)
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

resource "random_password" "password" {
  for_each = { for user in local.users : user.username => user }

  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "gitlab_user" "this" {
  for_each = { for user in local.users : user.username => user }

  email             = each.value.email
  name              = each.value.name
  username          = each.value.username
  can_create_group  = each.value.can_create_group // false
  is_admin          = each.value.is_admin         // false
  is_external       = each.value.is_external      // false
  namespace_id      = each.value.namespace_id
  note              = each.value.note
  password          = each.value.password == null ? random_password.password[each.value.username].result : each.value.password
  projects_limit    = each.value.projects_limit
  reset_password    = each.value.reset_password
  skip_confirmation = each.value.skip_confirmation
  state             = each.value.state // "active"
}


resource "gitlab_user_custom_attribute" "this" {
  for_each = {
    for attr in flatten([for u in local.users : u.custom_attributes if length(u.custom_attributes) > 0]) :
    attr.key => attr
  }
  user  = each.value.user
  key   = each.value.key
  value = each.value.value
  depends_on = [
    gitlab_user.this
  ]
}

resource "gitlab_user_gpgkey" "this" {
  for_each = {
    for gpg in flatten([for u in local.users : u.gpgkeys if length(u.gpgkeys) > 0]) :
    gpg.key => gpg
  }
  user_id = each.value.user_id
  key     = each.value.key
  depends_on = [
    gitlab_user.this
  ]
}

resource "gitlab_user_sshkey" "this" {
  for_each = {
    for ssh in flatten([for u in local.users : u.sshkeys if length(u.sshkeys) > 0]) :
    ssh.key => ssh
  }
  user_id    = each.value.user_id
  title      = each.value.title
  key        = each.value.key
  expires_at = each.value.expires_at
  depends_on = [
    gitlab_user.this
  ]
}

resource "gitlab_personal_access_token" "this" {
  for_each = {
    for token in flatten([for u in local.users : u.access_tokens if length(u.access_tokens) > 0]) :
    token.name => token
  }
  user_id    = gitlab_user.this[each.value.user_id]
  name       = each.value.name
  expires_at = each.value.expires_at
  scopes     = each.value.scopes
  depends_on = [
    gitlab_user.this
  ]
}

data "gitlab_users" "this" {
  active = true
  depends_on = [
    gitlab_user.this
  ]
}

locals {
  exists_users = { for user in data.gitlab_users.this.users : user.username => user }
}
