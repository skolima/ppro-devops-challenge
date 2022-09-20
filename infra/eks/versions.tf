terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-running-state"
    key            = "global/s3/eks.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-running-locks"
    encrypt        = true
  }

  required_version = "~> 1.2"
}
