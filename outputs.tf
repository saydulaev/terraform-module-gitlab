output "gitlab_metadata" {
  description = "Gitlab metadata"
  value       = data.gitlab_metadata.this
}

output "groups_id" {
  value = distinct(concat(values(gitlab_group.parent)[*].id, values(gitlab_group.other)[*].id))
}

output "users_id" {
  value = values(gitlab_user.this)[*].id
}

output "projects_id" {
  value     = values(gitlab_project.this)[*].id
  sensitive = false
}


/*
output "verify_empty_obj" {
  value = {} == {} ? format("null") : format("not null")
}

output "verify_not_empty_obj" {
  value = { one : 1 } == {} ? format("null") : format("not null")
}
*/