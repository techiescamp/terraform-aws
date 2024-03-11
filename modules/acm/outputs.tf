output "cert_domain_name" {
  description = "The valid domain name associated with the SSL/TLS certificate."
  value       = aws_acm_certificate.ssl_cert.domain_name
}

output "cert_expiry_date" {
  description = "The expiration date of the SSL/TLS certificate."
  value       = aws_acm_certificate.ssl_cert.not_after
}

output "cert_renewal_eligibility" {
  description = "Indicates if the SSL/TLS certificate is eligible for renewal."
  value       = aws_acm_certificate.ssl_cert.renewal_eligibility
}

output "cert_source" {
  description = "The source or type of the SSL/TLS certificate (e.g., 'AMAZON_ISSUED', 'IMPORTED')."
  value       = aws_acm_certificate.ssl_cert.type
}
