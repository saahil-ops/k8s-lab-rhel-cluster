#!/bin/bash
# Script to join a worker node to the Kubernetes cluster
# Note: you need to run kubeadm join command on your masster node and copy the output to the below mentioned kubeadm join cmd.
set -e

echo "[+] Disabling swap"
sudo swapoff -a
sudo sed -i '/swap/d' /etc/fstab

echo "[+] Joining the Kubernetes cluster..."

# Replace this below line with your real join command
sudo kubeadm join <MASTER_IP>:6443 --token <TOKEN> \
    --discovery-token-ca-cert-hash sha256:<HASH>

echo "[✔] Worker node joined successfully!"

# After this is done you can run "kubectl get nodes" to check the status of both nodes. 
