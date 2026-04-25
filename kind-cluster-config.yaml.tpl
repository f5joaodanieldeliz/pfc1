kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: ${cluster_name}
networking:
    ipFamily: IPv4
    podSubnet: "10.244.0.0/16"
    serviceSubnet: "10.96.0.0/12"
#dualStack: true
kubeProxyMode: "none"
nodes:
- role: control-plane
  image: kindest/node:${kubernetes_version}
  extraMounts:
  - hostPath: /var/run/docker.sock
    containerPath: /var/run/docker.sock
  extraPortMappings:
  - containerPort: 80
    hostPort: ${http_port_mapping}
    listenAddress: "0.0.0.0"
    protocol: TCP
  - containerPort: 443
    hostPort: ${https_port_mapping}
    listenAddress: "0.0.0.0"
    protocol: TCP
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        system-reserved: "cpu=${cpu_count},memory=${memory_gb}Gi"
        kube-reserved: "cpu=${cpu_count},memory=${memory_gb}Gi"
        eviction-hard: "memory.available<100Mi,nodefs.available<10%,nodefs.inodesFree<5%"
        eviction-soft: "memory.available<200Mi"
        eviction-soft-grace-period: "memory.available=1m"
        image-gc-high-threshold: "80"
        image-gc-low-threshold: "70"
        cpu-manager-policy: "none" # Pode ser "static" para cargas de trabalho de baixa latência
        topology-manager-policy: "none" # Pode ser "single-numa-node" para otimização de NUMA
  - |
    kind: ClusterConfiguration
    controllerManager:
      extraArgs:
  labels:
    node-role.kubernetes.io/control-plane: "" # Label padrão para control-plane.
    kind.x-k8s.io/cluster-name: "${cluster_name}" # Label para identificar o cluster.
    app.kubernetes.io/component: "kind-node" # Exemplo de label customizada.
node-cidr-mask-size: "24"
scheduler:
extraArgs:
address: "0.0.0.0"
apiServer:
extraArgs:
runtime-config: "api/all=true" # Habilita todas as APIs de runtime.
feature-gates: "EphemeralContainers=true,CSIStorageCapacity=true"

kind: KubeletConfiguration
cgroupMode: systemd