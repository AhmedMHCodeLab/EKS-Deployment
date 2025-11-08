# 1. ExternalDNS Role
module "external_dns_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.0"

  role_name = "${var.cluster_name}-external-dns"

  # This creates the policy from the docs
  attach_external_dns_policy = true
  
  # This restricts it to only YOUR hosted zone (more secure than "*")
  external_dns_hosted_zone_arns = [data.aws_route53_zone.main.arn]

  # This sets up the OIDC trust relationship
  oidc_providers = {
    main = {
      provider_arn               = aws_iam_openid_connect_provider.cluster.arn
      namespace_service_accounts = ["external-dns:external-dns"]
    }
  }

  tags = var.tags
}

# 2. CertManager Role
module "cert_manager_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.0"

  role_name = "${var.cluster_name}-cert-manager"

  attach_cert_manager_policy    = true  # ← Creates Route53 policy
  cert_manager_hosted_zone_arns = [data.aws_route53_zone.main.arn]

  oidc_providers = {
    main = {
      provider_arn               = aws_iam_openid_connect_provider.cluster.arn
      namespace_service_accounts = ["cert-manager:cert-manager"]
    }
  }

  tags = var.tags
}

module "ebs_csi_driver_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.0"

  role_name = "${var.cluster_name}-ebs-csi-driver"

  attach_ebs_csi_policy = true

  oidc_providers = {
    main = {
      provider_arn               = aws_iam_openid_connect_provider.cluster.arn
      namespace_service_accounts = ["kube-system:ebs-csi-controller-sa"]
    }
  }

  tags = var.tags
}