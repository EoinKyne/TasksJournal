resource "kubernetes_deployment_v1" "journal_app" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
    labels = {
      app = var.app_name
    }
  }

  spec {
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

        volume {
          name = var.files_directory_name
          empty_dir {}
        }

        init_container {
          name  = var.init_container_name
          image = var.init_container_image
          image_pull_policy = var.init_container_image_pull_policy

          command = ["python", "manage.py", "migrate"]

          env_from {
            config_map_ref {
              name = var.config_name
            }
          }
          env_from {
            secret_ref {
              name = var.secret_name
            }
          }
        }

        container {
          name  = var.app_name
          image = var.image
          image_pull_policy = var.image_pull_policy

          env {
            name = "POSTGRES_USER"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = var.db_user_key
              }
            }
          }

          command = ["sh", "-c"]
          args = [<<EOT
             set -x
             until pg_isready -h journal-app-data-headless -p 5432 -U "$POSTGRES_USER"; do
               echo 'Waiting for Postgres...'
               sleep 2
             done

             echo 'Postgres ready, running migrations...'
             python manage.py migrate || exit 1

             echo 'Starting Gunicorn...'
             gunicorn journal.wsgi:application --bind 0.0.0.0:8000
             EOT
             ]

          port {
            container_port = var.container_port
          }

          env {
            name  = var.db_env_host_name
            value = var.db_host
          }

          env_from {
            config_map_ref {
              name = var.config_name
            }
          }
          env_from {
            secret_ref {
              name = var.secret_name
            }
          }

          volume_mount {
            name       = var.files_directory_name
            mount_path = var.files_directory_mount_path
          }

          #readiness_probe {
          #  http_get {
          #    path = "/health/"
          #    port = 8000
          #  }
          #  initial_delay_seconds = 10
          #  period_seconds        = 5
          #}

          #liveness_probe {
          #  http_get {
          #    path = "/health/"
          #    port = 8000
          #  }
          #  initial_delay_seconds = 15
          #  period_seconds        = 20
          #}

          resources {
            limits = {
              cpu    = var.resources_limits_cpu
              memory = var.resources_limits_memory
            }
            requests = {
              cpu    = var.resources_requests_cpu
              memory = var.resources_requests_memory
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "journal_app" {
  metadata {
    name      = var.app_name
  }

  spec {
    selector = {
      app = var.app_name
    }

    port {
      port        = var.container_port
      target_port = var.container_port
    }
  }
}

resource "kubernetes_horizontal_pod_autoscaler_v2" "app_hpa" {
  metadata {
    name      = var.service_name
    namespace = var.namespace
  }

  spec {
    scale_target_ref {
      kind = var.target_ref_kind
      name = var.app_name
      api_version = var.target_ref_api_version
    }

    min_replicas = var.min_replicas
    max_replicas = var.max_replicas

    metric {
      type = var.metric_type

      resource {
        name = var.resource_target_name
        target {
          type = var.resource_target_type
          average_utilization = var.resource_target_cpu_utilization_percentage
        }
      }
    }
  }
}