data "aws_iam_policy_document" "this" {
  count = var.create_iam_role ? 1 : 0

  statement {
    sid     = "EKSNodeAssumeRole"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

module "role" {
  count  = var.create_iam_role ? 1 : 0
  source = "./../assumable-role"

  name                    = "nodegroup_${var.name}"
  policy_document         = data.aws_iam_policy_document.this[0].json
  create_instance_profile = true
  attach_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ]
}

resource "aws_eks_node_group" "this" {
  cluster_name    = var.cluster_name
  node_group_name = var.name
  node_role_arn   = var.create_iam_role ? module.role[0].role_arn : var.role_arn
  subnet_ids      = var.subnet_ids

  disk_size      = var.disk_size
  capacity_type  = var.capacity_type
  instance_types = var.instance_types

  labels = var.labels

  dynamic "taint" {
    for_each = var.taints
    content {
      key    = taint.key
      value  = lookup(taint.value, "value")
      effect = taint.value.effect
    }
  }

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  update_config {
    max_unavailable = 2
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    module.role[0]
  ]
}
