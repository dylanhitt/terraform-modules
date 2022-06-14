resource "aws_cloudwatch_log_group" "this" {
  count = var.create_log_group ? 1 : 0

  name              = "/aws/eks/${var.name}/cluster"
  retention_in_days = 7
}

data "aws_iam_policy_document" "eks_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

module "eks_role" {
  source = "./assumable-role"

  name               = "eks_${var.name}"
  policy_document    = data.aws_iam_policy_document.eks_policy.json
  attach_policy_arns = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"]
}

resource "aws_eks_cluster" "this" {
  depends_on = [aws_cloudwatch_log_group.this]

  name     = var.name
  role_arn = module.eks_role.role_arn
  version  = var.cluster_version

  tags = var.tags

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = var.public_access
    subnet_ids              = var.subnet_ids
  }
}

module "oidc" {
  count  = var.oidc ? 1 : 0
  source = "./oidc-provider"

  oidc_issuer = aws_eks_cluster.this.identity[0].oidc[0].issuer
}

module "cni_addon" {
  count  = var.cni_addon ? 1 : 0
  source = "./cni-addon"

  oidc_issuer                 = aws_eks_cluster.this.identity[0].oidc[0].issuer
  openid_connect_provider_arn = module.oidc[0].openid_connect_provider_arn
  cluster_name                = aws_eks_cluster.this.name
}

module "default_nodegroup" {
  count  = var.default_nodegroup ? 1 : 0
  source = "./nodegroup"

  cluster_name    = aws_eks_cluster.this.name
  name            = "default_group-${aws_eks_cluster.this.name}"
  subnet_ids      = var.subnet_ids
  disk_size       = 20
  create_iam_role = true
}
