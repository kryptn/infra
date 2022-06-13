resource "aws_kms_key" "terraform_bucket_key" {
  description             = "Key to encrypt bucket objects"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_kms_alias" "tf" {
  name          = "alias/terraform-bucket-key"
  target_key_id = aws_kms_key.terraform_bucket_key.key_id
}