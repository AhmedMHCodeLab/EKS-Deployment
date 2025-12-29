project_name = "EKSDeployment"
environment  = "dev"
owner        = "AhmedMHCodeLab"

aws_region         = "us-east-1"
availability_zones = ["us-east-1a", "us-east-1b"]
aws_account_id     = "590183934190"

vpc_cidr = "10.0.0.0/16"

cluster_name    = "EKSDeployment-cluster"
cluster_version = "1.29"

cluster_endpoint_private_access      = true
cluster_endpoint_public_access       = true
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

node_instance_types = ["t3.medium"]
node_capacity_type  = "ON_DEMAND"
node_desired_size   = 2
node_min_size       = 1
node_max_size       = 3
node_disk_size      = 20

route53_zone_id = "Z05803441P04TCJ0P5ELV"

tags = {
  "Project" = "EKSDeployment"
  "Owner"   = "AhmedMHCodeLab"
}
