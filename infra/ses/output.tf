output "domain_identity_token" {
  description = "Domain identity tokens"
  value       = module.ses.domain_identity_token
}

output "domain_verification" {
  description = "Verification status of the domain identity"
  value       = module.ses.domain_verification
}

output "dkim_tokens" {
  description = "DKIM tokens for domain identity"
  value       = module.ses.dkim_tokens
}

output "domain_mail" {
  description = "Email address associated with the domain identity"
  value       = module.ses.domain_mail
}

output "route53_dkim_fqdn" {
  description = "FQDN for the Route 53 DKIM DNS record"
  value       = module.ses.route53_dkim_fqdn
}

output "route53_spf_mx_fqdn" {
  description = "FQDN for the Route 53 SPF MX DNS record"
  value       = module.ses.route53_spf_mx_fqdn
}

output "route53_spf_txt_fqdn" {
  description = "FQDN for the Route 53 SPF TXT DNS record"
  value       = module.ses.route53_spf_txt_fqdn
}

output "iam_user_name" {
  description = "IAM user name associated with SES"
  value       = module.ses.iam_user_name
}

output "iam_user_policy" {
  description = "IAM policy associated with the IAM user"
  value       = module.ses.iam_user_policy
}

