resource "aws_cloudwatch_log_group" "this" {
  count = var.create_log_group != "" ? 1 : 0

  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = 7
}

resource "aws_eks_cluster" "this" {
  depends_on = [aws_cloudwatch_log_group.this]

  name     = var.name
  role_arn = var.role_arn
  version  = var.cluster_version

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = var.public_access
    subnet_ids              = var.subnet_ids # need to default this to grabbing tow different default subnets in a VPC
  }
}
