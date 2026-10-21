output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_app_subnet_ids" {
  description = "IDs of the private application subnets"
  value       = module.vpc.private_app_subnet_ids
}

output "private_db_subnet_ids" {
  description = "IDs of the private database subnets"
  value       = module.vpc.private_db_subnet_ids
}

output "alb_security_group_id" {
  description = "Security group ID for the Application Load Balancer"
  value       = module.security_groups.alb_security_group_id
}

output "app_security_group_id" {
  description = "Security group ID for the application containers"
  value       = module.security_groups.app_security_group_id
}

output "db_security_group_id" {
  description = "Security group ID for the PostgreSQL database"
  value       = module.security_groups.db_security_group_id
}