# AWS Production Platform

An AWS infrastructure project built using Terraform, Docker, and AWS services.

## Project Overview

This project demonstrates Infrastructure as Code (IaC), AWS networking, IAM, containerization, and Amazon ECR image management.

## Technologies Used

- AWS VPC
- Public and private subnets across two Availability Zones
- AWS Security Groups
- AWS IAM roles
- Amazon ECR
- Docker
- Python and Flask
- Terraform

## Current Implementation

- Created a VPC with public, private application, and private database subnet configurations.
- Created security groups for the load balancer, application, and database access rules.
- Created IAM roles for ECS task execution and application tasks.
- Created an Amazon ECR repository with image scanning, immutable tags, and a lifecycle policy.
- Built and tested a Flask application locally.
- Built a Docker image and tested the application endpoints.
- Pushed Docker image version `1.0.0` to Amazon ECR.
- Added Terraform configuration for ECS and an Application Load Balancer. These resources have **not yet been deployed**.

## Application Endpoints

| Endpoint | Purpose |
|---|---|
| `/` | Application status |
| `/health` | Health check |
| `/version` | Application version |

The Flask application listens on port `8000`.

## Project Structure

```text
aws-production-platform/
├── application/
│   ├── app.py
│   ├── requirements.txt
│   ├── Dockerfile
│   └── .dockerignore
├── architecture/
├── docs/
├── scripts/
└── terraform/
    ├── environments/
    │   └── dev/
    └── modules/
        ├── vpc/
        ├── security-groups/
        ├── iam/
        ├── ecr/
        ├── ecs/
        └── alb/
```

## Validation

Terraform configuration was validated, and a Terraform plan was generated for the pending ECS and ALB resources. The Flask application and Docker container were tested locally, and the ECR image was pushed successfully.

## Deployment Status

The VPC, security groups, IAM roles, and ECR repository were applied through Terraform. ECS and ALB deployment is pending.

## Cleanup

AWS resources created for this project should be reviewed and destroyed when no longer needed to avoid ongoing charges.
