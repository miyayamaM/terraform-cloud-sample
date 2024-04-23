terraform {
  // terraformのバージョンを指定
  required_version = ">= 1.5.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "aws_access_key" {}
variable "aws_access_secret_key" {}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_access_secret_key
  region = "ap-northeast-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-20240423"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
