resource "kind_cluster" "this" {
  name = var.cluster_name

  kind_config {
    kind       = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
      
      kubeadm_config_patches = [
        "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    v: \"5\"\n---\nkind: JoinConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    v: \"5\"\n"
      ]
      
      extra_port_mappings {
        container_port = 80
        host_port      = 80
      }
      
      extra_port_mappings {
        container_port = 443
        host_port      = 443
      }
    }
  }

  #node_config {
  #  vcpu   = var.node_vcpu
  #  memory = "${var.node_memory}GB"
  #}
}