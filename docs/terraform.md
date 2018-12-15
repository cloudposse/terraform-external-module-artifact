## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| filename | Artifact filename | string | `lambda.zip` | no |
| filename | Artifact filename | string | `lambda.zip` | no |
| git_ref | Git hash corresponding to the remote artifact. Leave blank and it will be computed from the `module_path` checkout | string | `` | no |
| git_ref | Git hash corresponding to the remote artifact. Leave blank and it will be computed from the `module_path` checkout | string | `` | no |
| module_name | Name of the terraform module | string | - | yes |
| module_name | Name of the terraform module | string | - | yes |
| module_path | Local path to the terraform module; e.g. `${path.module}` | string | - | yes |
| module_path | Local path to the terraform module; e.g. `${path.module}` | string | - | yes |
| url | URL template for the remote artifact | string | `https://artifacts.cloudposse.com/$${module_name}/$${git_ref}/$${filename}` | no |
| url | URL template for the remote artifact | string | `https://artifacts.cloudposse.com/$${module_name}/$${git_ref}/$${filename}` | no |

## Outputs

| Name | Description |
|------|-------------|
| file | - |
| file | Full path to the locally downloaded file |
| git_ref | - |
| git_ref | Git commit hash corresponding to the artifact |
| url | - |
| url | URL corresponding to the artifact |

