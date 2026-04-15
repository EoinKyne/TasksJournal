provider "kubernetes" {
  config_path = "D:\\minikube\\.kube\\config"
  config_context = "minikube"
  #host                   = "https://127.0.0.1:53547"
  #client_certificate     = "D:\\minikube\\.minikube\\profiles\\minikube\\client.crt"
  #client_key             = "D:\\minikube\\.minikube\\profiles\\minikube\\client.key"
  #cluster_ca_certificate = "D:\\minikube\\.minikube\\ca.crt"
}

provider "helm" {
  kubernetes {
    config_path = "D:\\minikube\\.kube\\config"
    #host                   = "https://127.0.0.1:53547"
    #client_certificate     = "D:\\minikube\\.minikube\\profiles\\minikube\\client.crt"
    #client_key             = "D:\\minikube\\.minikube\\profiles\\minikube\\client.key"
    #cluster_ca_certificate = "D:\\minikube\\.minikube\\ca.crt"
  }
}