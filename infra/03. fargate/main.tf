provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = "ppro-devops-challenge"
      Environment = terraform.workspace
    }
  }
}

data "aws_availability_zones" "available" {}
