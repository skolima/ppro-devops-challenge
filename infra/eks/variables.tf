variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {
    Project     = "ppro-devops-challenge"
  }
}
