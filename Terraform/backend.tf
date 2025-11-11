# Backend configuration for remote state management
# 
# Why S3 + DynamoDB?
# - S3: Stores state file (with versioning for rollback)
# - DynamoDB: Provides state locking (prevents concurrent modifications)
# - Encryption: State file contains sensitive data (passwords, keys)
#
# IMPORTANT: Update the bucket name with output from setup-backend.sh

terraform {
  backend "s3" {
    bucket         = "eks-deployment-terraform-state-1762892533"
    key            = "state/eks-deployment.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "eks-deployment-terraform-lock"
  }
}