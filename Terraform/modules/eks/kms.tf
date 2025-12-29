resource "aws_kms_key" "eks" {
  description             = "${var.cluster_name} EKS secret encryption key"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = merge(
    {
      Name = "${var.cluster_name}-eks-secrets"
    },
    var.tags
  )
}

resource "aws_kms_alias" "eks" {
  name          = "alias/${var.cluster_name}-eks-secrets"
  target_key_id = aws_kms_key.eks.key_id
}