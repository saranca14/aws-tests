provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAWZTYRQA7GBXUM2O2"
  secret_key = "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"
}
resource "aws_kms_key" "client_kms_key" {
  description       = "KMS key for Secrets Manager"
  key_usage         = "ENCRYPT_DECRYPT"
}

resource "aws_kms_alias" "key_alias" {
  name          = "alias/secretsmanager-kms-key"
  target_key_id = aws_kms_key.client_kms_key.key_id
}
