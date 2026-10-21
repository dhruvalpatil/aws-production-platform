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


module "alb" {
  source = "../../modules/alb"

  name                  = "aws-production-platform-dev"
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  alb_security_group_id = module.security_groups.alb_security_group_id

  app_port = 8000
}

module "ecs" {
  source = "../../modules/ecs"

  name      = "aws-production-platform-dev"
  image_uri = "${module.ecr.repository_url}:1.0.0"

  # Demo setup: public subnets avoid NAT Gateway charges.
  subnet_ids = module.vpc.public_subnet_ids

  app_security_group_id   = module.security_groups.app_security_group_id
  task_execution_role_arn = module.iam.ecs_task_execution_role_arn
  task_role_arn           = module.iam.ecs_task_role_arn
  target_group_arn        = module.alb.target_group_arn

  container_port = 8000
  cpu            = 256
  memory         = 512
  desired_count  = 1

  depends_on = [module.alb]
}
