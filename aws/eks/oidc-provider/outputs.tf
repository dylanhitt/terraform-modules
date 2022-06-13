output "openid_connect_provider_arn" {
  value       = aws_iam_openid_connect_provider.this.arn
  description = "ARN of the openid provider"
}
