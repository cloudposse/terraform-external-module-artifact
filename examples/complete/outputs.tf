output "git_ref" {
  description = "Git commit hash corresponding to the artifact"
  value       = module.external_module_artifact.git_ref
}

output "file" {
  description = "Full path to the locally downloaded file"
  value       = module.external_module_artifact.file
}

output "url" {
  description = "URL corresponding to the artifact"
  value       = module.external_module_artifact.url
}

output "base64sha256" {
  description = "Base64 encoded SHA256 hash of the local file"
  value       = module.external_module_artifact.base64sha256
}
