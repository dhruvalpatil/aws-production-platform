# AWS Resource Cleanup

## Purpose

Use this guide to remove AWS resources created for this project and reduce ongoing charges.

## Before Cleanup

1. Open PowerShell in the project root directory.
2. Confirm that the AWS CLI is using the intended AWS account and region.
3. Review the Terraform state and confirm that it contains only resources belonging to this project.
4. Keep the Terraform state files available until cleanup has been verified. Do not commit state files to GitHub.

## Review Resources

```powershell
aws sts get-caller-identity
aws configure get region

cd .\terraform\environments\dev
terraform state list
terraform plan -destroy
```

Carefully review the destroy plan. Do not proceed if it includes unrelated resources.

## Remove the ECR Image

If Terraform cannot delete the ECR repository because it still contains images, delete the project image first:

```powershell
aws ecr batch-delete-image --repository-name aws-production-platform-dev --image-ids imageTag=1.0.0 --region ap-south-1
```

Only run this command if the repository and image are confirmed to belong to this project.

## Destroy Project Infrastructure

After reviewing the plan and confirming the resources:

```powershell
terraform destroy
```

Review the final plan and type `yes` only if every resource listed is safe to delete.

## Verify Cleanup

Check the AWS console and CLI to confirm that the project resources have been removed. Keep the GitHub source code and documentation; deleting AWS resources does not require deleting the repository.
