terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

# Define AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create an S3 Bucket for Terraform State
resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-bucket-1234"
  force_destroy = true  # Deletes the bucket when running terraform destroy

  lifecycle {
    prevent_destroy = false  # Set true if you want to prevent accidental deletions
  }

  versioning {
    enabled = true  # Enables state versioning
  }

  tags = {
    Name = "Terraform State Bucket"
    Environment = "Dev"
  }
}

# Create a DynamoDB Table for State Locking
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
    Environment = "Dev"
  }
}
