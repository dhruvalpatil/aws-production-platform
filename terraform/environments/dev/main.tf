module "vpc" {
  source = "../../modules/vpc"

  name = "aws-production-platform-dev"

  vpc_cidr = "10.0.0.0/16"

  availability_zones = [
    "ap-south-1a",
    "ap-south-1b"
  ]

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_app_subnet_cidrs = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]

  private_db_subnet_cidrs = [
    "10.0.21.0/24",
    "10.0.22.0/24"
  ]
}

module "security_groups" {
  source = "../../modules/security-groups"

  name = "aws-production-platform-dev"

  vpc_id = module.vpc.vpc_id

  allowed_ingress_cidr = "0.0.0.0/0"
}

module "iam" {
  source = "../../modules/iam"

  name = "aws-production-platform-dev"
}

module "ecr" {
  source = "../../modules/ecr"

  name = "aws-production-platform-dev"
}