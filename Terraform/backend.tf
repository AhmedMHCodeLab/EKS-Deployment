terraform {
  backend "s3" {
    bucket         = "eks-deployment-terraform-state-1762963376"
    key            = "state/eks-deployment.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "eks-deployment-terraform-lock-1762963376"
  }
}