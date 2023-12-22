provider "aws" {
  region  = var.aws_region

  default_tags {
    tags = {
      Project   = "LenioLabs"
      CreatedAt = "2023-12-21"
      ManagedBy = "Terraform"
      Owner     = "Joaquin Orue"
      Env       = var.env
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.4.0"
    }
  }

  required_version = "~> 1.0"
}

