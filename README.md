# Kubernetes Cluster on AWS/VMware using RHEL 9 🚀

This project demonstrates how to set up a Kubernetes cluster from scratch using `kubeadm` on RHEL 9 EC2 instances hosted on AWS.

---

## 🧰 Tools & Technologies

- AWS EC2 (t2.medium)
- RHEL 9
- kubeadm + kubelet + kubectl
- containerd as container runtime
- Calico CNI
- NGINX demo app

---

## 🧱 Architecture

![Architecture Diagram](./assets/architecture-diagram.png)

---

## ⚙️ Prerequisites

- AWS account with EC2 key pair
- 2 EC2 instances (1 master, 1 worker)
- RHEL 9 image with at least 2 vCPUs and 4 GB RAM
- Port 6443, 10250, and 30000-32767 opened

---

## 🛠️ Setup Steps

> You can find all scripts inside `setup/` folder.

### 1. Install Dependencies (on all nodes)

```bash
bash setup/install-kubeadm.sh
