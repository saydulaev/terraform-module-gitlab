/*
resource "gitlab_project" "awesome_project" {
  name             = "awesome_project"
  description      = "My awesome project."
  visibility_level = "public"
}

resource "gitlab_integration_custom_issue_tracker" "tracker" {
  project     = gitlab_project.awesome_project.id
  project_url = "https://customtracker.com/issues"
  issues_url  = "https://customtracker.com/TEST-:id"
}

resource "gitlab_integration_emails_on_push" "emails" {
  project    = gitlab_project.awesome_project.id
  recipients = "myrecipient@example.com myotherrecipient@example.com"
}

resource "gitlab_integration_external_wiki" "wiki" {
  project           = gitlab_project.awesome_project.id
  external_wiki_url = "https://MyAwesomeExternalWikiURL.com"
}

resource "gitlab_integration_github" "github" {
  project        = gitlab_project.awesome_project.id
  token          = "REDACTED"
  repository_url = "https://github.com/gitlabhq/terraform-provider-gitlab"
}

resource "gitlab_integration_jira" "jira" {
  project  = gitlab_project.awesome_project.id
  url      = "https://jira.example.com"
  username = "user"
  password = "mypass"
}

resource "gitlab_integration_mattermost" "mattermost" {
  project      = gitlab_project.awesome_project.id
  webhook      = "https://webhook.com"
  username     = "myuser"
  push_events  = true
  push_channel = "push_chan"
}

resource "gitlab_integration_microsoft_teams" "teams" {
  project     = gitlab_project.awesome_project.id
  webhook     = "https://testurl.com/?token=XYZ"
  push_events = true
}

resource "gitlab_integration_pipelines_email" "email" {
  project                      = gitlab_project.awesome_project.id
  recipients                   = ["gitlab@user.create"]
  notify_only_broken_pipelines = true
  branches_to_be_notified      = "all"
}

resource "gitlab_integration_slack" "slack" {
  project      = gitlab_project.awesome_project.id
  webhook      = "https://webhook.com"
  username     = "myuser"
  push_events  = true
  push_channel = "push_chan"
}
*/