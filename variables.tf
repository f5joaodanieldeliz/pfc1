variable "cluster_name" {
  description = "Nome do cluster Kind."
  type        = string
  default     = "kind-cluster" # Valor padrão para o nome do cluster
}

variable "kubernetes_version" {
  description = "Versão do Kubernetes para o cluster Kind."
  type        = string
  default     = "v1.27.0" # Versão padrão do Kubernetes
}

variable "node_image" {
  description = "Imagem do nó Kind a ser utilizada (ex: kindest/node:v1.27.0)."
  type        = string
  default     = null # Opcional, se null, usa a imagem padrão do Kind para a versão K8s.
}

variable "cpu_count" {
  description = "Número de vCPUs para o nó do cluster Kind."
  type        = number
  default     = 2 # Padrão de 2 vCPUs
}
variable "memory_gb" {
  description = "Quantidade de memória RAM em GB para o nó do cluster Kind."
  type        = number
  default     = 4 # Padrão de 4 GB de RAM
}


variable "node_vcpu" {
  description = "Número de vCPUs para o nó"
  type        = number
  default     = 2
}

variable "node_memory" {
  description = "Quantidade de RAM para o nó em GB"
  type        = number
  default     = 4
}