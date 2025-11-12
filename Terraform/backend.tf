# Why S3 + DynamoDB?
# - S3: Stores state file (with versioning for rollback)
# - DynamoDB: Provides state locking (prevents concurrent modifications)
# - Encryption: State file contains sensitive data (passwords, keys)

terraform {
  backend "s3" {
    bucket         = "eks-deployment-terraform-state-1762947828"
    key            = "state/eks-deployment.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "eks-deployment-terraform-lock"
  }
}