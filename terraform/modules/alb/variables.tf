variable "name" {
  description = "Name prefix for ALB resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the target group"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for the load balancer"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group ID for the load balancer"
  type        = string
}

variable "app_port" {
  description = "Port on which the application listens"
  type        = number
  default     = 8000
}