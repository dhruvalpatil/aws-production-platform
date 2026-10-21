# AWS Production Platform

A production-grade AWS cloud infrastructure project built using Terraform, Docker, and AWS managed services.

## Project Objective

Design and deploy a secure, highly available, scalable, and observable application platform on AWS using Infrastructure as Code.

This project demonstrates real-world AWS and DevOps practices including:

- Infrastructure as Code with Terraform
- Multi-AZ AWS architecture
- Containerized application deployment
- CI/CD automation
- Secure networking
- Database management
- Secrets management
- Monitoring and alerting
- Infrastructure security
- Disaster recovery and troubleshooting

## ðŸ—ï¸ Architecture

The platform will use:

```text
                    Internet
                       â”‚
                       â–¼
              â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
              â”‚ Application     â”‚
              â”‚ Load Balancer   â”‚
              â”‚      ALB        â”‚
              â””â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”˜
                       â”‚
             â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
             â–¼                   â–¼
        â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”        â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
        â”‚ ECS Task â”‚        â”‚ ECS Task â”‚
        â”‚ AZ-1     â”‚        â”‚ AZ-2     â”‚
        â””â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”˜        â””â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”˜
             â”‚                   â”‚
             â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
                       â–¼
                â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
                â”‚ RDS PostgreSQLâ”‚
                â”‚  Multi-AZ     â”‚
                â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
