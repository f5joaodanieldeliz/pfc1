output "cluster_name" {
  description = "Nome do cluster Kind criado"
  value       = kind_cluster.this.name
}

output "kubeconfig" {
  description = "Caminho para o kubeconfig do cluster"
  value       = kind_cluster.this.kubeconfig_path
  sensitive   = true
}