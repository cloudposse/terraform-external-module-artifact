module "example" {
  source      = "../"
  filename    = "test.zip"
  git_ref     = "example"
  module_name = "terraform-external-module-artifact"
  module_path = "${path.module}"
}

output "url" {
  value = "${module.example.url}"
}

output "file" {
  value = "${module.example.file}"
}

output "base64sha256" {
  value = "${module.example.base64sha256}"
}
