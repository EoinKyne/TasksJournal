resource "kubernetes_stateful_set_v1" "journal_app_data" {
  metadata {
    name      = var.app_name
    labels = {
      app = var.app_name
    }
  }

  spec {
    service_name = var.service_name
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name  = var.container_name
          image = var.image
          image_pull_policy = var.image_pull_policy

          env {
            name = var.db_name_key
            value_from {
              secret_key_ref {
              name = var.secret_name
              key = var.db_name_key
              }
            }
          }
          env {
            name = var.db_user_key
            value_from {
              secret_key_ref {
              name = var.secret_name
              key = var.db_user_key
              }
            }
          }
          env {
            name = var.db_password_key
            value_from {
              secret_key_ref {
              name = var.secret_name
              key = var.db_password_key
              }
            }
          }

          port {
            container_port = var.container_port
          }

          env {
            name = var.storage_env_name
            value = var.storage_env_value
          }

          volume_mount {
            name       = var.storage_name
            mount_path = var.storage_path
          }

          readiness_probe {
            exec {
              command = ["sh", "-c", "pg_isready -h localhost -U var.db_user_key"]
            }
            initial_delay_seconds = var.readiness_probe_initial_delay_seconds
            period_seconds = var.readiness_probe_period_seconds
          }
        }
      }
    }
    volume_claim_template {

      metadata {
        name = var.storage_name
      }

      spec {
        access_modes = [var.storage_access_mode]

        storage_class_name = var.storage_class_name

        resources {
          requests = {
            storage = var.storage_size
          }
        }
      }
    }
  }
  depends_on = [kubernetes_service_v1.journal_app_data_headless]
}

resource "kubernetes_service_v1" "journal_app_data_headless" {
  metadata {
    name      = var.service_name
  }

  spec {
    cluster_ip = var.cluster_ip
    selector = {
      app = var.app_name
    }

    port {
      port        = var.container_port
      target_port = var.container_port
    }
  }
}