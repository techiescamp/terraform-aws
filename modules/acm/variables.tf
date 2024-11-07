variable "region" {
  type        = string
  description = "The AWS region where the Certificate Manager will be used."
}

variable "domain_name" {
  type        = string
  description = "The domain name associated with the SSL/TLS certificate."
}

variable "validation_method" {
  type        = string
  description = "The validation method used for certificate issuance (e.g., DNS, email)."
}

variable "key_algorithm" {
  type        = string
  description = "The cryptographic key algorithm used for the certificate (e.g., RSA, ECDSA)."
}

variable "certificate_transparency_logging_preference" {
  type        = string
  description = "The logging preference for certificate transparency (e.g., 'ENABLED' or 'DISABLED')."
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "A map of extra tags to attach to the AWS resources."
}

variable "name" {
  type        = string
  description = "A user-defined name for the AWS resources."
}

variable "environment" {
  type        = string
  description = "The name of the environment associated with the AWS resources."
}

variable "owner" {
  type        = string
  description = "The name of the owner or responsible party for the AWS resources."
}

variable "cost_center" {
  type        = string
  description = "The identifier for the cost center associated with the AWS resources."
}

variable "application" {
  type        = string
  description = "The name of the application or project related to the AWS resources."
}

variable "dns_domain_name" {
  type = string
  description = "Domain name of the Route 53"
}