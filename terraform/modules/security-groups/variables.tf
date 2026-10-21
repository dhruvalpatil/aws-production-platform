variable "name" {
  description = "Name prefix for security groups"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

variable "allowed_ingress_cidr" {
  description = "CIDR allowed to access the public application endpoint"
  type        = string
  default     = "0.0.0.0/0"
}