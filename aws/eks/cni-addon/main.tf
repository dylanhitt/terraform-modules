data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(var.oidc_issuer, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:aws-node"]
    }

    principals {
      identifiers = [var.openid_connect_provider_arn]
      type        = "Federated"
    }
  }
}

module "cni_role" {
  source = "./../assumable-role"

  name               = "cni_${var.cluster_name}"
  policy_document    = data.aws_iam_policy_document.this.json
  attach_policy_arns = ["arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"]
}

resource "aws_eks_addon" "this" {
  cluster_name             = var.cluster_name
  addon_name               = "vpc-cni"
  service_account_role_arn = module.cni_role.role_arn
}
