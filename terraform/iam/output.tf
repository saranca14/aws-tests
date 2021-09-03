output "cae_assume_role" {
  value = aws_iam_role.cae_assume_role.arn
}
output "cae_assume_role_policy" {
  value = aws_iam_policy.cae_assume_role_policy.arn
}
