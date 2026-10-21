# Deployment Guide

## Prerequisites

- AWS CLI configured with an AWS account
- Terraform installed
- Docker installed
- AWS permissions required to manage the project resources

## Application Setup

Open PowerShell from the project root directory.

### 1. Build the Docker image

```powershell
docker build -t aws-production-platform:1.0.0 .\application
```

### 2. Run the container locally

```powershell
docker run --name aws-production-platform -p 8000:8000 aws-production-platform:1.0.0
```

### 3. Test the application

Open these URLs in your browser:

- http://localhost:8000/
- http://localhost:8000/health
- http://localhost:8000/version

## Terraform Validation

```powershell
cd .\terraform\environments\dev
terraform init
terraform fmt -recursive ..\..
terraform validate
terraform plan
```

Review the plan before making any infrastructure changes.

## AWS Deployment Status

The VPC, security groups, IAM roles, and ECR repository have been applied through Terraform. Docker image `1.0.0` has been pushed to ECR.

The ECS and Application Load Balancer resources are configured in Terraform but have not been deployed. This guide does not claim that the application is publicly accessible through AWS.
