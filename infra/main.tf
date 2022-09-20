provider "aws" {
    region = var.region
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "ppro-devops-challenge-eks"
}
