output "policy_id" {
  value       = aws_organizations_policy.tag_policy.id
  description = "ID of the tag policy."
}