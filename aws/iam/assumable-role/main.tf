resource "aws_iam_role" "this" {
  name               = var.name
  assume_role_policy = file("${var.policy_document}")
  tags               = var.tags
}

resource "aws_iam_instance_profile" "this" {
  count = var.create_instance_profile != "" ? 1 : 0

  name = "${aws_iam_role.this.name}-profile"
  role = aws_iam_role.this.name
}
