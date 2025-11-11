# Project Configuration
project_name = "EKSDeployment"
environment  = "dev"
owner        = "AhmedMHCodeLab"

# AWS Configuration
aws_region         = "us-east-1"
availability_zones = ["us-east-1a", "us-east-1b"]
aws_account_id     = "590183934190"
oidc_provider_url  = "oidc.eks.us-east-1.amazonaws.com/id/33A487785EF148ADBF7679E6DCE1BA77"

# VPC Configuration
vpc_cidr = "10.0.0.0/16"

# EKS Cluster Configuration
cluster_name    = "EKSDeployment-cluster"
cluster_version = "1.29"

# API Endpoint Access
cluster_endpoint_private_access      = true
cluster_endpoint_public_access       = true
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

# Node Group Configuration
node_instance_types = ["t3.small"]
node_capacity_type  = "SPOT"
node_desired_size   = 2
node_min_size       = 1
node_max_size       = 3
node_disk_size      = 20

# Route53 Configuration
route53_zone_id = "Z05803441P04TCJ0P5ELV"

tags = {
  "Project" = "EKSDeployment"
  "Owner"   = "AhmedMHCodeLab"
}