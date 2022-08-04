terraform {
  backend "s3" {
    encrypt        = false
    bucket         = "scae-terraform-state"
    dynamodb_table = "terraform-state-lock"
    key            = ".terraform/terraform.tfstate"
    region         = "eu-central-1"
    
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
  region = var.region
}

provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
}