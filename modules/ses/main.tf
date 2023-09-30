#Domain Identity
resource "aws_ses_domain_identity" "domain_identity" {
  domain = var.domain_name
}

#Domain Identity Verification
resource "aws_ses_domain_identity_verification" "domain_verification" {
  domain = aws_ses_domain_identity.domain_identity.domain
}

#DKIM Authentication
resource "aws_ses_domain_dkim" "dkim_authentication" {
  domain = aws_ses_domain_identity.domain_identity.domain
}

resource "aws_route53_record" "dkim_record" {
  count   = var.dkim_record_count
  zone_id = var.zone_id
  name    = "${aws_ses_domain_dkim.dkim_authentication.dkim_tokens[count.index]}._domainkey"
  type    = var.dkim_record_type
  ttl     = var.dkim_ttl
  records = ["${aws_ses_domain_dkim.dkim_authentication.dkim_tokens[count.index]}.dkim.amazonses.com"]
}

#DOMAIN MAIL FROM
resource "aws_ses_domain_mail_from" "domain_mail" {
  domain           = aws_ses_domain_identity.domain_identity.domain
  mail_from_domain = "${var.custom_mail}.${aws_ses_domain_identity.domain_identity.domain}"
}

#SPF Authentication
data "aws_region" "current_region" {}

resource "aws_route53_record" "ses_domain_mail_from_mx" {
  zone_id = var.zone_id
  name    = aws_ses_domain_mail_from.domain_mail.mail_from_domain
  type    = var.spf_mx_record
  ttl     = var.spf_ttl
  records = [format("10 feedback-smtp.%s.amazonses.com", data.aws_region.current_region.name)]
}

resource "aws_route53_record" "ses_domain_mail_from_txt" {
  zone_id = var.zone_id
  name    = aws_ses_domain_mail_from.domain_mail.mail_from_domain
  type    = var.spf_txt_record
  ttl     = var.spf_ttl
  records = ["v=spf1 include:amazonses.com ~all"]
}

#SMTP Credentials
resource "aws_iam_user" "iam_user" {
  name = "${var.application}-SMTP-user"

  tags = merge(
    {
      Name        = var.name
      Environment = var.environment
      Owner       = var.owner
      CostCenter  = var.cost_center
      Application = var.application
    },
    var.tags
  )
}

resource "aws_iam_access_key" "access_key" {
  user = aws_iam_user.iam_user.name
}

data "aws_iam_policy_document" "ses_iam_policy" {
  statement {
    actions   = ["ses:SendRawEmail"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "ses_user_policy" {
  name   = "ses-user-policy"
  user   = aws_iam_user.iam_user.name
  policy = data.aws_iam_policy_document.ses_iam_policy.json

}











