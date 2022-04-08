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

# github_repository
output "github_repository_git_clone_url" {
  description = "URL(s) that can be provided to `git clone` to clone the repository anonymously via the git protocol."
  value       = { for repository in github_repository.this : repository.name => repository.git_clone_url }
}

output "github_repository_http_clone_url" {
  description = "URL(s) that can be provided to `git clone` to clone the repository via HTTPS."
  value       = { for repository in github_repository.this : repository.name => repository.http_clone_url }
}

output "github_repository_ssh_clone_url" {
  description = "URL(s) that can be provided to `git clone` to clone the repository via SSH."
  value       = { for repository in github_repository.this : repository.name => repository.ssh_clone_url }
}
