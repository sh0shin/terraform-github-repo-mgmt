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

# user ssh key
variable "github_user_ssh_key" {
  description = "Add/remove SSH keys from your user account."
  type = map(object({
    # object-key = title
    ssh_key = string
  }))
  default = {}
}

# membership
variable "github_membership_default_role" {
  description = "Default role of the user within the organization."
  type        = string
  default     = "member"
  nullable    = false

  validation {
    condition     = contains(["admin", "member"], var.github_membership_default_role)
    error_message = "The role must be one of member or admin."
  }
}

variable "github_membership" {
  description = "Add/remove users from your GitHub organization. See: [organization example](examples/organization/main.tf)"
  type        = any
  default     = {}

  validation {
    condition = alltrue([
      for o in var.github_membership : contains(["admin", "member"], try(o.role, "member"))
    ])
    error_message = "The role must be one of member or admin."
  }
}

# team
variable "github_team_default_description" {
  description = "Default description of the team."
  type        = string
  default     = ""
  nullable    = false
}

variable "github_team_default_privacy" {
  description = "Default level of privacy for the team. Must be one of secret or closed."
  type        = string
  default     = "secret"
  nullable    = false

  validation {
    condition     = contains(["secret", "closed"], var.github_team_default_privacy)
    error_message = "Level of privacy must be one of secret or closed."
  }
}

variable "github_team_default_create_default_maintainer" {
  description = "Default adds a default maintainer to the team."
  type        = bool
  default     = false
}

variable "github_team_members_default_role" {
  description = "Default role of the user within the team. Must be one of member or maintainer."
  type        = string
  default     = "member"
  nullable    = false

  validation {
    condition     = contains(["member", "maintainer"], var.github_team_members_default_role)
    error_message = "The role must be one of member or maintainer."
  }
}

variable "github_team" {
  description = "Add/remove teams from your organization. See: [organization example](examples/organization/main.tf)"
  type        = any
  default     = {}
}

# repository
variable "github_repository_default_visibility" {
  description = "Default visibility."
  type        = string
  default     = "private"
  nullable    = false

  validation {
    condition     = contains(["private", "public"], var.github_repository_default_visibility)
    error_message = "Repository visibility must be on of private or public."
  }
}

variable "github_repository_default_is_template" {
  description = "Default to tell GitHub that this is a template repository."
  type        = bool
  default     = false
}

variable "github_repository_default_description" {
  description = "Default description of the repository."
  type        = string
  default     = ""
  nullable    = false
}

variable "github_repository_default_homepage_url" {
  description = "Default URL of a page describing the project."
  type        = string
  default     = ""
  nullable    = false
}

variable "github_repository_default_topics" {
  description = "Default list of topics of the repository."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "github_repository_default_has_issue" {
  description = "Default enable/disable the GitHub Issues features on the repository."
  type        = bool
  default     = true
}

variable "github_repository_default_has_project" {
  description = "Default enable/disable the GitHub Projects features on the repository."
  type        = bool
  default     = false
}

variable "github_repository_default_has_wiki" {
  description = "Default enable/disable the GitHub Wiki features on the repository."
  type        = bool
  default     = false
}

variable "github_repository_default_allow_auto_merge" {
  description = "Default enable/disable auto-merging pull requests on the repository."
  type        = bool
  default     = false
}

variable "github_repository_default_allow_merge_commit" {
  description = "Default enable/disable merge commits on the repository."
  type        = bool
  default     = true
}

variable "github_repository_default_allow_rebase_merge" {
  description = "Default enable/disable rebase merges on the repository."
  type        = bool
  default     = true
}

variable "github_repository_default_allow_squash_merge" {
  description = "Default enable/disable squash merges on the repository."
  type        = bool
  default     = true
}

variable "github_repository_default_delete_branch_on_merge" {
  description = "Default enable/disable to automatically delete head branch after a pull request is merged."
  type        = bool
  default     = false
}

variable "github_repository_default_gitignore_template" {
  description = "Default name of the gitignore template without the extension. For example, 'Haskell'."
  type        = string
  default     = ""
  nullable    = false
}

variable "github_repository_default_license_template" {
  description = "Default name of the license template without the extension. For example, 'mit' or 'mpl-2.0'."
  type        = string
  default     = ""
  nullable    = false
}

variable "github_repository_default_auto_init" {
  description = "Default enable/disable to produce an initial commit in the repository."
  type        = bool
  default     = false
}

variable "github_repository_default_archive_on_destroy" {
  description = "Default enable/disable archive the repository instead of deleting on destroy."
  type        = bool
  default     = false
}

variable "github_repository_default_vulnerability_alerts" {
  description = "Default enable/disable security alerts for vulnerable dependencies."
  type        = bool
  default     = false
}

variable "github_repository_default_pages_path" {
  description = "Default GitHub Pages path."
  type        = string
  default     = "/"
  nullable    = false
}

variable "github_repository_default_pages_cname" {
  description = "Default GitHub Pages CNAME."
  type        = string
  default     = ""
  nullable    = false
}

variable "github_repository_default_pages" {
  description = "Default repository's GitHub Pages configuration."
  type = map(object({
    # object-key = branch
    path  = string
    cname = string
  }))
  default = {}
}

variable "github_repository_default_template" {
  description = "Default template repository to create this repository from."
  type = map(object({
    # object-key = repository
    owner = string
  }))
  default = {}
}

variable "github_repository" {
  description = "Repository to create and manage within your GitHub organization or personal account. See: [examples](examples/)"
  type        = any

  validation {
    condition = alltrue([
      for o in var.github_repository : contains(["private", "public"], try(o.visibility, "private"))
    ])
    error_message = "Repository visibility must be one of private or public."
  }
}

# team repository
variable "github_team_repository_default_permission" {
  description = "Default permissions of team members regarding the repository. Must be one of pull, triage, push, maintain, or admin."
  type        = string
  default     = "pull"
  nullable    = false

  validation {
    condition     = contains(["pull", "triage", "push", "maintain", "admin"], var.github_team_repository_default_permission)
    error_message = "Repository permission must be one pull, triage, push, maintain, or admin."
  }
}

variable "github_team_repository" {
  description = "Manage relationships between teams and repositories in your GitHub organization. See [organization example](examples/organization/main.tf)"
  type        = any
  default     = {}

  validation {
    condition = alltrue([
      for o in var.github_team_repository : contains(["pull", "triage", "push", "maintain", "admin"], try(o.permission, "pull"))
    ])
    error_message = "Repository permission must be one pull, triage, push, maintain, or admin."
  }
}
