MINIKUBE_VERSION = latest

.PHONY: minikube-install minikube-start addons status

minikube-install:
        curl -LO https://storage.googleapis.com/minikube/releases/$(MINIKUBE_VERSION)/minikube-linux-amd64
        sudo install minikube-linux-amd64 /usr/local/bin/minikube

minikube-start:
        minikube start --driver=docker --container-runtime=containerd  --memory=2200mb

addons:
        minikube addons enable metrics-server
        minikube addons enable ingress

status:
        minikube status
        kubectl get nodes

cluster: minikube-install minikube-start addons status