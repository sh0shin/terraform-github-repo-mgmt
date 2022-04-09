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

provider "github" {
  owner = var.github_owner
  token = var.github_token
}

resource "github_user_ssh_key" "this" {
  for_each = var.github_user_ssh_key
  title    = each.key
  key      = each.value.ssh_key
}

resource "github_membership" "this" {
  for_each = var.github_membership
  username = each.key
  role     = try(each.value.role, var.github_membership_default_role)
}

resource "github_team" "this" {
  for_each                  = var.github_team
  name                      = each.key
  description               = try(each.value.description, var.github_team_default_description)
  privacy                   = try(each.value.privacy, var.github_team_default_privacy)
  create_default_maintainer = try(each.value.create_default_maintainer, var.github_team_default_create_default_maintainer)
}

resource "github_team_members" "this" {
  for_each = var.github_team
  team_id  = github_team.this[each.key].id

  dynamic "members" {
    for_each = each.value.members
    content {
      username = github_membership.this[members.key].username
      role     = try(members.value.role, var.github_team_members_default_role)
    }
  }
}

resource "github_repository" "this" {
  for_each               = var.github_repository
  name                   = each.key
  visibility             = try(each.value.visibility, var.github_repository_default_visibility)
  is_template            = try(each.value.is_template, var.github_repository_default_is_template)
  description            = try(each.value.description, var.github_repository_default_description)
  homepage_url           = try(each.value.homepage_url, var.github_repository_default_homepage_url)
  topics                 = try(each.value.topics, var.github_repository_default_topics)
  has_issues             = try(each.value.has_issues, var.github_repository_default_has_issue)
  has_projects           = try(each.value.has_projects, var.github_repository_default_has_project)
  has_wiki               = try(each.value.has_wiki, var.github_repository_default_has_wiki)
  allow_auto_merge       = try(each.value.allow_auto_merge, var.github_repository_default_allow_auto_merge)
  allow_merge_commit     = try(each.value.allow_merge_commit, var.github_repository_default_allow_merge_commit)
  allow_rebase_merge     = try(each.value.allow_rebase_merge, var.github_repository_default_allow_rebase_merge)
  allow_squash_merge     = try(each.value.allow_squash_merge, var.github_repository_default_allow_squash_merge)
  delete_branch_on_merge = try(each.value.delete_branch_on_merge, var.github_repository_default_delete_branch_on_merge)
  gitignore_template     = try(each.value.gitignore_template, var.github_repository_default_gitignore_template)
  license_template       = try(each.value.license_template, var.github_repository_default_license_template)
  auto_init              = try(each.value.auto_init, var.github_repository_default_auto_init)
  archive_on_destroy     = try(each.value.archive_on_destroy, var.github_repository_default_archive_on_destroy)
  vulnerability_alerts   = try(each.value.vulnerability_alerts, var.github_repository_default_vulnerability_alerts)

  dynamic "pages" {
    for_each = try(each.value.pages, var.github_repository_default_pages)
    content {
      source {
        branch = pages.key
        path   = pages.value.path
      }
      cname = try(pages.value.cname, var.github_repository_default_pages_cname)
    }
  }

  dynamic "template" {
    for_each = try(each.value.template, var.github_repository_default_template)
    content {
      repository = template.key
      owner      = template.value.owner
    }
  }
}

resource "github_team_repository" "this" {
  for_each   = var.github_team_repository
  team_id    = github_team.this[split("@", each.key)[0]].id
  repository = github_repository.this[split("@", each.key)[1]].name
  permission = try(each.value.permission, var.github_team_repository_default_permission)
}
