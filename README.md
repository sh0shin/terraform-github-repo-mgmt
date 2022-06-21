# Terraform GitHub repository management

Terraform module which manages your GitHub user or organization repositories.

[//]: # ( BEGIN_TF_DOCS )

## Requirements

The following requirements are needed by this module:

- terraform (~> 1.1)

- github (~> 4.0)

## Providers

The following providers are used by this module:

- github (~> 4.0)

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

### github_repository

Description: Repository to create and manage within your GitHub organization or personal account. See: [examples](examples/)

Type: `any`

## Optional Inputs

The following input variables are optional (have default values):

### github_membership

Description: Add/remove users from your GitHub organization. See: [organization example](examples/organization/main.tf)

Type: `any`

Default: `{}`

### github_membership_default_role

Description: Default role of the user within the organization.

Type: `string`

Default: `"member"`

### github_repository_default_allow_auto_merge

Description: Default enable/disable auto-merging pull requests on the repository.

Type: `bool`

Default: `false`

### github_repository_default_allow_merge_commit

Description: Default enable/disable merge commits on the repository.

Type: `bool`

Default: `true`

### github_repository_default_allow_rebase_merge

Description: Default enable/disable rebase merges on the repository.

Type: `bool`

Default: `true`

### github_repository_default_allow_squash_merge

Description: Default enable/disable squash merges on the repository.

Type: `bool`

Default: `true`

### github_repository_default_archive_on_destroy

Description: Default enable/disable archive the repository instead of deleting on destroy.

Type: `bool`

Default: `false`

### github_repository_default_auto_init

Description: Default enable/disable to produce an initial commit in the repository.

Type: `bool`

Default: `false`

### github_repository_default_delete_branch_on_merge

Description: Default enable/disable to automatically delete head branch after a pull request is merged.

Type: `bool`

Default: `false`

### github_repository_default_description

Description: Default description of the repository.

Type: `string`

Default: `""`

### github_repository_default_gitignore_template

Description: Default name of the gitignore template without the extension. For example, 'Haskell'.

Type: `string`

Default: `""`

### github_repository_default_has_issue

Description: Default enable/disable the GitHub Issues features on the repository.

Type: `bool`

Default: `true`

### github_repository_default_has_project

Description: Default enable/disable the GitHub Projects features on the repository.

Type: `bool`

Default: `false`

### github_repository_default_has_wiki

Description: Default enable/disable the GitHub Wiki features on the repository.

Type: `bool`

Default: `false`

### github_repository_default_homepage_url

Description: Default URL of a page describing the project.

Type: `string`

Default: `""`

### github_repository_default_is_template

Description: Default to tell GitHub that this is a template repository.

Type: `bool`

Default: `false`

### github_repository_default_license_template

Description: Default name of the license template without the extension. For example, 'mit' or 'mpl-2.0'.

Type: `string`

Default: `""`

### github_repository_default_pages

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

### github_repository_default_pages_cname

Description: Default GitHub Pages CNAME.

Type: `string`

Default: `""`

### github_repository_default_pages_path

Description: Default GitHub Pages path.

Type: `string`

Default: `"/"`

### github_repository_default_template

Description: Default template repository to create this repository from.

Type:

```hcl
map(object({
    # object-key = repository
    owner = string
  }))
```

Default: `{}`

### github_repository_default_topics

Description: Default list of topics of the repository.

Type: `list(string)`

Default: `[]`

### github_repository_default_visibility

Description: Default visibility.

Type: `string`

Default: `"private"`

### github_repository_default_vulnerability_alerts

Description: Default enable/disable security alerts for vulnerable dependencies.

Type: `bool`

Default: `false`

### github_team

Description: Add/remove teams from your organization. See: [organization example](examples/organization/main.tf)

Type: `any`

Default: `{}`

### github_team_default_create_default_maintainer

Description: Default adds a default maintainer to the team.

Type: `bool`

Default: `false`

### github_team_default_description

Description: Default description of the team.

Type: `string`

Default: `""`

### github_team_default_privacy

Description: Default level of privacy for the team. Must be one of secret or closed.

Type: `string`

Default: `"secret"`

### github_team_members_default_role

Description: Default role of the user within the team. Must be one of member or maintainer.

Type: `string`

Default: `"member"`

### github_team_repository

Description: Manage relationships between teams and repositories in your GitHub organization. See [organization example](examples/organization/main.tf)

Type: `any`

Default: `{}`

### github_team_repository_default_permission

Description: Default permissions of team members regarding the repository. Must be one of pull, triage, push, maintain, or admin.

Type: `string`

Default: `"pull"`

### github_user_ssh_key

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

### github_repository_git_clone_url

Description: URL(s) that can be provided to `git clone` to clone the repository anonymously via the git protocol.

### github_repository_http_clone_url

Description: URL(s) that can be provided to `git clone` to clone the repository via HTTPS.

### github_repository_ssh_clone_url

Description: URL(s) that can be provided to `git clone` to clone the repository via SSH.

[//]: # ( END_TF_DOCS )
