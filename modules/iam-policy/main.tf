resource "aws_iam_role" "iam_role" {
  name = var.instance_role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "iam.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "iam_policy" {
  name = "iam_policy"
  policy = file("${path.module}../../../environments/dev/file/lb-asg.json")
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  role = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.iam_policy.arn
}