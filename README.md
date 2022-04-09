# Terraform GitHub repository management

Terraform module which manages your GitHub user or organization repositories.

[//]: # ( BEGIN_TF_DOCS )

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement_terraform) (~> 1.0, < 1.2)

- <a name="requirement_github"></a> [github](#requirement_github) (~> 4.0)

## Providers

The following providers are used by this module:

- <a name="provider_github"></a> [github](#provider_github) (~> 4.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [github_membership.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/membership) (resource)
- [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) (resource)
- [github_team.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) (resource)
- [github_team_members.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_members) (resource)
- [github_team_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) (resource)
- [github_user_ssh_key.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/user_ssh_key) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_github_repository"></a> [github_repository](#input_github_repository)

Description: Repository to create and manage within your GitHub organization or personal account. See: [examples](examples/)

Type: `any`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_github_membership"></a> [github_membership](#input_github_membership)

Description: Add/remove users from your GitHub organization. See: [organization example](examples/organization/main.tf)

Type: `any`

Default: `{}`

### <a name="input_github_membership_default_role"></a> [github_membership_default_role](#input_github_membership_default_role)

Description: Default role of the user within the organization.

Type: `string`

Default: `"member"`

### <a name="input_github_owner"></a> [github_owner](#input_github_owner)

Description: The GitHub organization or user account to manage, when not provided and a token is available, the user account owning the token will be used. Can also be sourced from `GITHUB_OWNER` environment variable.

Type: `string`

Default: `null`

### <a name="input_github_repository_default_allow_auto_merge"></a> [github_repository_default_allow_auto_merge](#input_github_repository_default_allow_auto_merge)

Description: Default enable/disable auto-merging pull requests on the repository.

Type: `bool`

Default: `false`

### <a name="input_github_repository_default_allow_merge_commit"></a> [github_repository_default_allow_merge_commit](#input_github_repository_default_allow_merge_commit)

Description: Default enable/disable merge commits on the repository.

Type: `bool`

Default: `true`

### <a name="input_github_repository_default_allow_rebase_merge"></a> [github_repository_default_allow_rebase_merge](#input_github_repository_default_allow_rebase_merge)

Description: Default enable/disable rebase merges on the repository.

Type: `bool`

Default: `true`

### <a name="input_github_repository_default_allow_squash_merge"></a> [github_repository_default_allow_squash_merge](#input_github_repository_default_allow_squash_merge)

Description: Default enable/disable squash merges on the repository.

Type: `bool`

Default: `true`

### <a name="input_github_repository_default_archive_on_destroy"></a> [github_repository_default_archive_on_destroy](#input_github_repository_default_archive_on_destroy)

Description: Default enable/disable archive the repository instead of deleting on destroy.

Type: `bool`

Default: `false`

### <a name="input_github_repository_default_auto_init"></a> [github_repository_default_auto_init](#input_github_repository_default_auto_init)

Description: Default enable/disable to produce an initial commit in the repository.

Type: `bool`

Default: `false`

### <a name="input_github_repository_default_delete_branch_on_merge"></a> [github_repository_default_delete_branch_on_merge](#input_github_repository_default_delete_branch_on_merge)

Description: Default enable/disable to automatically delete head branch after a pull request is merged.

Type: `bool`

Default: `false`

### <a name="input_github_repository_default_description"></a> [github_repository_default_description](#input_github_repository_default_description)

Description: Default description of the repository.

Type: `string`

Default: `null`

### <a name="input_github_repository_default_gitignore_template"></a> [github_repository_default_gitignore_template](#input_github_repository_default_gitignore_template)

Description: Default name of the gitignore template without the extension. For example, 'Haskell'.

Type: `string`

Default: `null`

### <a name="input_github_repository_default_has_issue"></a> [github_repository_default_has_issue](#input_github_repository_default_has_issue)

Description: Default enable/disable the GitHub Issues features on the repository.

Type: `bool`

Default: `true`

### <a name="input_github_repository_default_has_project"></a> [github_repository_default_has_project](#input_github_repository_default_has_project)

Description: Default enable/disable the GitHub Projects features on the repository.

Type: `bool`

Default: `false`

### <a name="input_github_repository_default_has_wiki"></a> [github_repository_default_has_wiki](#input_github_repository_default_has_wiki)

Description: Default enable/disable the GitHub Wiki features on the repository.

Type: `bool`

Default: `false`

### <a name="input_github_repository_default_homepage_url"></a> [github_repository_default_homepage_url](#input_github_repository_default_homepage_url)

Description: Default URL of a page describing the project.

Type: `string`

Default: `null`

### <a name="input_github_repository_default_is_template"></a> [github_repository_default_is_template](#input_github_repository_default_is_template)

Description: Default to tell GitHub that this is a template repository.

Type: `bool`

Default: `false`

### <a name="input_github_repository_default_license_template"></a> [github_repository_default_license_template](#input_github_repository_default_license_template)

Description: Default name of the license template without the extension. For example, 'mit' or 'mpl-2.0'.

Type: `string`

Default: `null`

### <a name="input_github_repository_default_pages"></a> [github_repository_default_pages](#input_github_repository_default_pages)

Description: Default repository's GitHub Pages configuration.

Type:

```hcl
map(object({
    # object-key = branch
    path  = string
    cname = string
  }))
```

Default: `{}`

### <a name="input_github_repository_default_pages_cname"></a> [github_repository_default_pages_cname](#input_github_repository_default_pages_cname)

Description: Default GitHub Pages CNAME.

Type: `string`

Default: `null`

### <a name="input_github_repository_default_template"></a> [github_repository_default_template](#input_github_repository_default_template)

Description: Default template repository to create this repository from.

Type:

```hcl
map(object({
    # object-key = repository
    owner = string
  }))
```

Default: `{}`

### <a name="input_github_repository_default_topics"></a> [github_repository_default_topics](#input_github_repository_default_topics)

Description: Default list of topics of the repository.

Type: `list(string)`

Default: `[]`

### <a name="input_github_repository_default_visibility"></a> [github_repository_default_visibility](#input_github_repository_default_visibility)

Description: Default visibility.

Type: `string`

Default: `"private"`

### <a name="input_github_repository_default_vulnerability_alerts"></a> [github_repository_default_vulnerability_alerts](#input_github_repository_default_vulnerability_alerts)

Description: Default enable/disable security alerts for vulnerable dependencies.

Type: `bool`

Default: `false`

### <a name="input_github_team"></a> [github_team](#input_github_team)

Description: Add/remove teams from your organization. See: [organization example](examples/organization/main.tf)

Type: `any`

Default: `{}`

### <a name="input_github_team_default_create_default_maintainer"></a> [github_team_default_create_default_maintainer](#input_github_team_default_create_default_maintainer)

Description: Default adds a default maintainer to the team.

Type: `bool`

Default: `false`

### <a name="input_github_team_default_description"></a> [github_team_default_description](#input_github_team_default_description)

Description: Default description of the team.

Type: `string`

Default: `null`

### <a name="input_github_team_default_privacy"></a> [github_team_default_privacy](#input_github_team_default_privacy)

Description: Default level of privacy for the team. Must be one of secret or closed.

Type: `string`

Default: `"secret"`

### <a name="input_github_team_members_default_role"></a> [github_team_members_default_role](#input_github_team_members_default_role)

Description: Default role of the user within the team. Must be one of member or maintainer.

Type: `string`

Default: `"member"`

### <a name="input_github_team_repository"></a> [github_team_repository](#input_github_team_repository)

Description: Manage relationships between teams and repositories in your GitHub organization. See [organization example](examples/organization/main.tf)

Type: `any`

Default: `{}`

### <a name="input_github_team_repository_default_permission"></a> [github_team_repository_default_permission](#input_github_team_repository_default_permission)

Description: Default permissions of team members regarding the repository. Must be one of pull, triage, push, maintain, or admin.

Type: `string`

Default: `"pull"`

### <a name="input_github_token"></a> [github_token](#input_github_token)

Description: A GitHub token, can also be sourced from the `GITHUB_TOKEN` environment variable.

Type: `string`

Default: `null`

### <a name="input_github_user_ssh_key"></a> [github_user_ssh_key](#input_github_user_ssh_key)

Description: Add/remove SSH keys from your user account.

Type:

```hcl
map(object({
    # object-key = title
    ssh_key = string
  }))
```

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_github_repository_git_clone_url"></a> [github_repository_git_clone_url](#output_github_repository_git_clone_url)

Description: URL(s) that can be provided to `git clone` to clone the repository anonymously via the git protocol.

### <a name="output_github_repository_http_clone_url"></a> [github_repository_http_clone_url](#output_github_repository_http_clone_url)

Description: URL(s) that can be provided to `git clone` to clone the repository via HTTPS.

### <a name="output_github_repository_ssh_clone_url"></a> [github_repository_ssh_clone_url](#output_github_repository_ssh_clone_url)

Description: URL(s) that can be provided to `git clone` to clone the repository via SSH.

[//]: # ( END_TF_DOCS )
