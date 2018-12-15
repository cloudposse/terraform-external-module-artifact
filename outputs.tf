output "git_ref" {
  description = "Git commit hash corresponding to the artifact"
  value       = "${local.git_ref}"
}

output "file" {
  description = "Full path to the locally downloaded file"
  value       = "${local.output_file}"
}

output "url" {
  description = "URL corresponding to the artifact"
  value       = "${local.url}"
}
