provider "aws" {
  region = var.region
}

module "external_module_artifact" {
  source         = "../../"
  filename       = var.filename
  module_name    = var.module_name
  module_path    = var.module_path
  url            = var.url
  git_ref        = var.git_ref
  curl_arguments = var.curl_arguments
}
