output "endpoint" {
  value     = aws_eks_cluster.this.endpoint
  sensitive = true
}

output "certificate_authority_data" {
  value     = aws_eks_cluster.this.certificate_authority[0].data
  sensitive = true
}
