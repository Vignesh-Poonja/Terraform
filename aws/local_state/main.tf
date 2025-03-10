terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

# Define the AWS Provider
provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

# Define an EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}