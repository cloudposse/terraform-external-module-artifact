<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| aws | >= 2.0 |
| external | >= 1.2 |
| local | >= 1.3 |
| template | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| external | >= 1.2 |
| template | >= 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| curl\_arguments | Arguments that should get passed to `curl` | `list(string)` | <pre>[<br>  "-fsSL"<br>]</pre> | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| filename | Artifact filename | `string` | `"lambda.zip"` | no |
| git\_ref | Git hash corresponding to the remote artifact. Leave blank and it will be computed from the `module_path` checkout | `string` | `""` | no |
| module\_name | Name of the terraform module | `string` | n/a | yes |
| module\_path | Local path to the terraform module; e.g. `${path.module}` | `string` | n/a | yes |
| url | URL template for the remote artifact | `string` | `"https://artifacts.cloudposse.com/$${module_name}/$${git_ref}/$${filename}"` | no |

## Outputs

| Name | Description |
|------|-------------|
| base64sha256 | Base64 encoded SHA256 hash of the local file |
| file | Full path to the locally downloaded file |
| git\_ref | Git commit hash corresponding to the artifact |
| url | URL corresponding to the artifact |

<!-- markdownlint-restore -->
