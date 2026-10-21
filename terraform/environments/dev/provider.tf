provider "aws" {
  region = "ap-south-1"

  default_tags {
    tags = {
      Project     = "aws-production-platform"
      Environment = "dev"
      ManagedBy   = "Terraform"
      Owner       = "Dhruval"
    }
  }
}