terraform {
  required_version = ">= 1.3.9"
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "16.11.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }
    gpg = {
      source = "Olivr/gpg"
      version = ">= 0.2.1"
    }
    tls = {
      source = "hashicorp/tls"
      version = ">= 4.0.5"
    }
  }
}

provider "gitlab" {
  base_url    = "https://gitlab.example.local/api/v4/"
  cacert_file = "ca-bundle.crt"
  // token = "glpat-***"
}
