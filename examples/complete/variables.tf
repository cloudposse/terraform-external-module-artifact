variable "region" {
  type        = string
  description = "AWS Region"
}

variable "filename" {
  type        = string
  description = "Artifact filename"
}

variable "module_name" {
  type        = string
  description = "Name of the terraform module"
}

variable "git_ref" {
  type        = string
  description = "Git hash corresponding to the remote artifact. Leave blank and it will be computed from the `module_path` checkout"
  default     = ""
}

variable "url" {
  type        = string
  description = "URL template for the remote artifact"
  default     = "https://artifacts.cloudposse.com/$$${module_name}/$$${git_ref}/$$${filename}"
}

variable "curl_arguments" {
  type        = string
  description = "Arguments that should get passed to `curl`"
  default     = ["-fsSL"]
}
