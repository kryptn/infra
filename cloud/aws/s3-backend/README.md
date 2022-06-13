


```terraform

terraform {
  backend "s3" {
    bucket         = "infra-remote-tf-state"
    key            = "state/$repo/$unique/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = "true"
    kms_key_id     = "alias/terraform-bucket-key"
    dynamodb_table = "terraform-state"
  }
}

```