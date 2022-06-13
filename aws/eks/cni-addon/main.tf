resource "aws_eks_addon" "example" {
  cluster_name = var.cluster_name
  addon_name   = "vpc-cni"
}
