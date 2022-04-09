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

module "repo_mgmt_organization" {
  source = "../.."

  # provider settings
  github_owner = "my-github-organization" # or use `GITHUB_OWNER` environment variable.
  github_token = "my-github-token"        # or use `GITHUB_TOKEN` environment variable.

  # change defaults (see: variables.tf)
  github_team_repository_default_permission = "push"

  # membership
  github_membership = {
    "my-github-user"    = { role = "admin" },
    "other-github-user" = {}, # use default role (member)
  }

  # team
  github_team = {
    "my-github-team" = {
      description = "My GitHub team (;"
      members = {
        "my-github-user"    = { role = "maintainer" },
        "other-github-user" = {}, # use default role (member)
      }
    }
  }

  # repository
  github_repository = {
    "my-private-repository" = {
      description = "My private repository"
    },
    "my-public-repository" = {
      description = "My public repository"
      visibility  = "public"
    },
  }

  # team repository
  github_team_repository = {
    "my-github-team@my-private-repository" = { permission = "maintain" },
    "my-github-team@my-public-repository"  = {}, # use default permission (push)
  }
}
