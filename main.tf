data "external" "curl" {
  program = concat(["curl"], var.curl_arguments, ["--write-out", "{\"success\": \"true\", \"filename_effective\": \"%%{filename_effective}\"}", "-o", local.output_file, local.url])
}

# data "external" "git" {
#   count   = var.git_ref == "" ? 0 : 1
#   program = ["git", "-C", var.module_path, "log", "-n", "1", "--pretty=format:{\"ref\": \"%H\"}"]
# }

locals {
  external_curl_filename_effective = data.external.curl.result.filename_effective
  # external_git_ref                 = join("", data.external.git.*.result.ref)
  # git_ref                          = var.git_ref == "" ? local.external_git_ref : var.git_ref
  output_file                      = join("/", [var.module_path, var.filename])
  url                              = data.template_file.url.rendered
}

data "template_file" "url" {
  template = replace(var.url, "$$", "$")

  vars = {
    filename    = var.filename
    # git_ref     = local.git_ref
    module_name = var.module_name
  }
}
