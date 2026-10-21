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

## Architecture

The platform will use:

```text
                         Internet
                            |
                            v
                 +----------------------+
                 | Application Load     |
                 | Balancer (ALB)       |
                 +----------+-----------+
                            |
                  +---------+---------+
                  |                   |
                  v                   v
           +-------------+     +-------------+
           | ECS Task    |     | ECS Task    |
           | AZ-1        |     | AZ-2        |
           +------+------+     +------+------+
                  |                   |
                  +---------+---------+
                            |
                            v
                 +----------------------+
                 | RDS PostgreSQL       |
                 | Multi-AZ             |
                 +----------------------+