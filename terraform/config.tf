# Terraform Block
terraform {
  #required_version = ">= 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_version = "~> 1.7.2"   
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = ">= 4.65"
      #version
      version = ">= 5.38"
    }
  }
}

# Provider Block
provider "aws" {
  region     = "us-east-1"
  profile    = default
}