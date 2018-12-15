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
