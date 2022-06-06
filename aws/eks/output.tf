output "endpoint" {
  value     = aws_eks_cluster.this.endpoint
  sensitive = true
}

output "kubeconfig-certificate-authority-data" {
  value     = aws_eks_cluster.this.certificate_authority[0].data
  sensitive = true
}