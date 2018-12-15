## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| filename | Artifact filename | string | `lambda.zip` | no |
| git_ref | Git hash corresponding to the remote artifact. Leave blank and it will be computed from the `module_path` checkout | string | `` | no |
| module_name | Name of the terraform module | string | - | yes |
| module_path | Local path to the terraform module; e.g. `${path.module}` | string | - | yes |
| url | URL template for the remote artifact | string | `https://artifacts.cloudposse.com/$${module_name}/$${git_ref}/$${filename}` | no |

## Outputs

| Name | Description |
|------|-------------|
| file | - |
| git_ref | - |
| url | - |

