output "git_ref" {
  description = "Git commit hash corresponding to the artifact"
  value       = local.git_ref
}

output "file" {
  description = "Full path to the locally downloaded file"
  value       = local.external_curl_filename_effective
}

output "url" {
  description = "URL corresponding to the artifact"
  value       = local.url
}

output "base64sha256" {
  description = "Base64 encoded SHA256 hash of the local file"
  value       = filebase64sha256(local.external_curl_filename_effective)
}

