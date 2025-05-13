terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.97.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "backend" {
  source = "../modules/bootstrap"
  #variable for the module
  name_of_s3_bucket    = "pin2-2405-grupo8"
}
