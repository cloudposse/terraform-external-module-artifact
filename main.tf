data "external" "curl" {
  count      = module.this.enabled ? 1 : 0
  program    = concat(["curl"], var.curl_arguments, ["--write-out", "{\"success\": \"true\", \"filename_effective\": \"%%{filename_effective}\"}", "-o", local.output_file, local.url])
  depends_on = [data.external.git]
}

data "external" "git" {
  count   = module.this.enabled && var.git_ref == "" ? 1 : 0
  program = ["git", "-C", var.module_path, "log", "-n", "1", "--pretty=format:{\"ref\": \"%H\"}"]
}
  

locals {
  external_curl_filename_effective = join("", data.external.curl.*.result.filename_effective)
  external_git_ref                 = join("", data.external.git.*.result.ref)
  git_ref                          = var.git_ref == "" ? local.external_git_ref : var.git_ref
  output_file                      = join("/", [var.module_path, var.filename])
  url                              = join("", data.template_file.url.*.rendered)
}

data "template_file" "url" {
  count    = module.this.enabled ? 1 : 0
  template = replace(var.url, "$$", "$")

  vars = {
    filename    = var.filename
    git_ref     = local.git_ref
    module_name = var.module_name
  }
}
