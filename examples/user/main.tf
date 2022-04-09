# vim: set ft=terraform :
#
# Copyright (C) 2022 Chris 'sh0shin' Frage
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License, version 3,
# as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
#

terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

provider "github" {
  # provider settings
  owner = "my-github-user"  # or use `GITHUB_OWNER` environment variable.
  token = "my-github-token" # or use `GITHUB_TOKEN` environment variable.
}

module "repo_mgmt_user" {
  source = "../.."

  # change defaults (see: variables.tf)
  github_repository_default_visibility = "public"

  # repository
  github_repository = {
    "my-private-repository" = {
      description = "My private repository"
      visibility  = "private"
    },
    "my-public-repository" = {
      description = "My public repository"
    },
  }
}
