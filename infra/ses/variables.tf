variable "region" {
  type        = string
  description = "Region of the EC2 instance"
}

variable "domain_name" {
  type        = string
  description = "Name of the domain"
}

variable "dkim_record_count" {
  type        = number
  description = "Number of DKIM records to create"
}

variable "zone_id" {
  type        = string
  description = "ID of the DNS zone where records will be added"
}

variable "dkim_record_type" {
  type        = string
  description = "Type of DKIM records to create"
}

variable "dkim_ttl" {
  type        = number
  description = "Time To Live (TTL) for DKIM records"
}

variable "custom_mail" {
  type        = string
  description = "Custom email address to associate with the domain"
}

variable "spf_mx_record" {
  type        = string
  description = "SPF MX record value for domain"
}

variable "spf_txt_record" {
  type        = string
  description = "SPF TXT record value for domain"
}

variable "spf_ttl" {
  type        = number
  description = "Time To Live (TTL) for SPF records"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Tags to associate with the resources"
}

variable "name" {
  type        = string
  description = "Name of the resource"
}

variable "environment" {
  type        = string
  description = "Environment where the resource is deployed"
}

variable "owner" {
  type        = string
  description = "Owner of the resource"
}

variable "cost_center" {
  type        = string
  description = "Cost center responsible for the resource"
}

variable "application" {
  type        = string
  description = "Application to which the resource belongs"
}
