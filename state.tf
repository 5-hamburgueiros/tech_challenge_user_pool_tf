terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.1.0"
    }

    time = {
      source  = "hashicorp/time"
      version = ">= 0.9.1"
    }
  }

  backend "s3" {
    bucket = "tech-challenge-tf-tfstate"
    key    = "aws-cognito.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}
