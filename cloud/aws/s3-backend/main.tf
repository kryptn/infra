terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }


}

provider "aws" {
  region = "us-west-2"

  default_tags {
    tags = {
      project = "s3-backend"
    }
  }
}