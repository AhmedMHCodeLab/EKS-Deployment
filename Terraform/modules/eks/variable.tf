variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
}

variable "cluster_endpoint_private_access" {
  description = "Enable private access to the EKS cluster endpoint"
  type        = bool
}

variable "cluster_endpoint_public_access" {
  description = "Enable public access to the EKS cluster endpoint"
  type        = bool
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks allowed to access the EKS cluster endpoint"
  type        = list(string)
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "owner" {
  description = "Owner for tagging"
  type        = string
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "VPC ID where EKS cluster will be created"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for EKS cluster"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for EKS cluster"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "VPC CIDR block for security group rules"
  type        = string
}

variable "node_instance_types" {
  description = "List of instance types for worker nodes"
  type        = list(string)
}

variable "node_capacity_type" {
  description = "Capacity type: ON_DEMAND or SPOT"
  type        = string
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "node_disk_size" {
  description = "Disk size in GB for worker nodes"
  type        = number
}

variable "route53_zone_id" {
  description = "Route53 hosted zone ID for DNS records"
  type        = string
}