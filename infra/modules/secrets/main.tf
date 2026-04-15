resource "kubernetes_secret_v1" "app_secrets" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
  }

  data = {
    POSTGRES_DB = var.POSTGRES_DB
    POSTGRES_USER = var.POSTGRES_USER
    POSTGRES_PASSWORD = var.POSTGRES_PASSWORD
    SECRET_KEY = var.SECRET_KEY
  }
}