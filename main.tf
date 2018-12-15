variable "filename" {
  description = "Artifact filename"
  default     = "lambda.zip"
}

variable "module_name" {
  description = "Name of the terraform module"
}

variable "module_path" {
  description = "Local path to the terraform module; e.g. `${path.module}`"
}

variable "git_ref" {
  description = "Git hash corresponding to the remote artifact. Leave blank and it will be computed from the `module_path` checkout"
  default     = ""
}

variable "url" {
  description = "URL template for the remote artifact"
  default     = "https://artifacts.cloudposse.com/$${module_name}/$${git_ref}/$${filename}"
}

data "external" "curl" {
  program = ["curl", "-sSL", "--write-out", "{\"success\": \"true\"}", "-o", "${local.output_file}", "${local.url}"]
}

data "external" "git" {
  count   = "${var.git_ref == "" ? 1 : 0}"
  program = ["git", "-C", "${var.module_path}", "log", "-n", "1", "--pretty=format:{\"ref\": \"%H\"}"]
}

locals {
  external_git_ref = "${join("", data.external.git.*.result.ref)}"
  git_ref          = "${var.git_ref == "" ? local.external_git_ref : var.git_ref}"
}

locals {
  output_file = "${join("/", list(var.module_path, var.filename))}"
}

data "template_file" "url" {
  template = "${replace(var.url, "$$$$", "$")}"

  vars {
    filename    = "${var.filename}"
    git_ref     = "${local.git_ref}"
    module_name = "${var.module_name}"
  }
}

locals {
  url = "${data.template_file.url.rendered}"
}

output "git_ref" {
  value = "${local.git_ref}"
}

output "file" {
  value = "${local.output_file}"
}

output "url" {
  value = "${local.url}"
}
