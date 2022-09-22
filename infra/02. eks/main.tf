provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project   = "ppro-devops-challenge"
      Workspace = terraform.workspace
    }
  }
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "ppro-devops-challenge-eks"
}
