## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| curl_arguments | Arguments that should get passed to `curl` | string | `-fsSL` | no |
| enabled | Set to false to prevent the module from creating any resources | bool | `true` | no |
| filename | Artifact filename | string | `lambda.zip` | no |
| git_ref | Git hash corresponding to the remote artifact. Leave blank and it will be computed from the `module_path` checkout | string | `` | no |
| module_name | Name of the terraform module | string | - | yes |
| module_path | Local path to the terraform module; e.g. `$${path.module}` | string | - | yes |
| url | URL template for the remote artifact | string | `https://artifacts.cloudposse.com/$$${module_name}/$$${git_ref}/$$${filename}` | no |

## Outputs

| Name | Description |
|------|-------------|
| base64sha256 | Base64 encoded SHA256 hash of the local file |
| file | Full path to the locally downloaded file |
| git_ref | Git commit hash corresponding to the artifact |
| url | URL corresponding to the artifact |

