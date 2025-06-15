output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "kubeconfig" {
  value = <<EOT
Run this command to update kubeconfig:
aws eks update-kubeconfig --region ${var.region} --name ${aws_eks_cluster.eks.name}
EOT
}