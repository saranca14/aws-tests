# Outputs: values that are needed later by other resources
#
output "customer_kms_key_id" {
  value = aws_kms_key.client_kms_key.key_id
}
