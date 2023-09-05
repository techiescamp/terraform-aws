output "domain_identity_token" {
  description = "Domain identity tokens"
  value       = aws_ses_domain_identity.domain_identity.verification_token
}

output "domain_verification" {
  description = "Verification status of the domain identity"
  value       = aws_ses_domain_identity_verification.domain_verification.id
}

output "dkim_tokens" {
  description = "DKIM tokens for domain identity"
  value       = aws_ses_domain_dkim.dkim_authentication.dkim_tokens
}

output "domain_mail" {
  description = "Email address associated with the domain identity"
  value       = aws_ses_domain_mail_from.domain_mail.id
}

output "route53_dkim_fqdn" {
  description = "FQDN for the Route 53 DKIM DNS record"
  value       = aws_route53_record.dkim_record.*.fqdn
}

output "route53_spf_mx_fqdn" {
  description = "FQDN for the Route 53 SPF MX DNS record"
  value       = aws_route53_record.ses_domain_mail_from_mx.fqdn
}

output "route53_spf_txt_fqdn" {
  description = "FQDN for the Route 53 SPF TXT DNS record"
  value       = aws_route53_record.ses_domain_mail_from_txt.fqdn
}

output "iam_user_name" {
  description = "IAM user name associated with SES"
  value       = aws_iam_user.iam_user.name
}

output "iam_user_policy" {
  description = "IAM policy associated with the IAM user"
  value       = aws_iam_user_policy.ses_user_policy.name
}

