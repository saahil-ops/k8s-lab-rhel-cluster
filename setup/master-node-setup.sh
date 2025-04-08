#!/bin/bash
# Script to initialize the master node in Kubernetes

set -e

echo "[+] Initializing Kubernetes master node..."

sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-advertise-address=$(hostname -i)

echo "[+] Setting up kubeconfig for current user..."
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "[+] Applying Calico CNI plugin for networking..."
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/calico.yaml

echo "[+] Master node initialized successfully!"
echo "[*] Save the following 'kubeadm join' command for your worker node:"

kubeadm token create --print-join-command



# make the script executable and After running, copy the output of kubeadm join ... — you’ll need it for the worker node setup in the next script.
