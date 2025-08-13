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
  bucket = "my-unique-terraform-bucket-12345"
  tags = {
    Name        = "My unique bucket"
    Environment = "Dev"
    Project     = "NewFeature"
  }
}

# Create an AWS EC2 instance
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0" # This is a publicly available Amazon Linux 2 AMI
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorldServer"
  }
}
