# Configure the AWS provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Create an AWS S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "sjw-bucket-081325"
  tags = {
    Name        = "Demo bucket"
    Environment = "Dev"
    Project     = "NewFeature"
  }
}

# Create an AWS EC2 instance
resource "aws_instance" "web_server" {
  ami           = "ami-0de716d6197524dd9" # This is a publicly available Amazon Linux 2 AMI
  instance_type = "t2.small"
  tags = {
    Name = "HelloWorldServer"
  }
}
