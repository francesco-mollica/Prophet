terraform {
  backend "s3" {
    encrypt        = false
    bucket         = "prophet-terraform-state-production"
    dynamodb_table = "terraform-state-lock-dynamo"
    key            = ".terraform/terraform.tfstate"
    region         = "us-east-1"
    
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "us-east-1"
}
