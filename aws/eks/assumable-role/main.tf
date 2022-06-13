resource "aws_iam_role" "this" {
  name               = var.name
  assume_role_policy = var.policy_document
  tags               = var.tags
}

resource "aws_iam_instance_profile" "this" {
  count = var.create_instance_profile ? 1 : 0

  name = "${aws_iam_role.this.name}-profile"
  role = aws_iam_role.this.name
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = toset(var.attach_policy_arns)

  policy_arn = each.key
  role       = aws_iam_role.this.name
}
