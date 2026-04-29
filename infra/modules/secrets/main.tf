resource "kubernetes_secret_v1" "app_secrets" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
  }

  data = {
    POSTGRES_DB = var.postgres_db
    POSTGRES_USER = var.postgres_user
    POSTGRES_PASSWORD = var.postgres_password
    SECRET_KEY = var.secret_key
  }
}