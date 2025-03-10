terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-1234"  # Replace with your actual bucket name
    key            = "terraform.tfstate"  # Path in S3 where the state file is stored
    region         = "us-east-1"
    encrypt        = true  # Encrypts the state file
    dynamodb_table = "terraform-lock-table"  # Enables state locking
  }
}
