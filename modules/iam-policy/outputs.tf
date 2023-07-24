output "iam_role" {
  description = "iam role name"
  value = aws_iam_role.my_role.name
}