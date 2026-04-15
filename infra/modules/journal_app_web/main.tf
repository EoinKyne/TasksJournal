resource "kubernetes_deployment_v1" "journal_app_web" {
  metadata {
    name      = var.app_name
    labels = {
      app = var.app_name
    }
  }

  spec {
    replicas = 1

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

        volume {
          name = var.nginx_config_name
          config_map {
            name = kubernetes_config_map_v1.nginx_config.metadata[0].name
          }
        }

        init_container {
          name  = var.init_container_name
          image = var.init_container_image
          image_pull_policy = var.init_container_image_pull_policy

          command = ["sh", "-c", "cp -r /app/staticfiles/* /static-files/"]

          volume_mount {
            name = var.files_directory_name
            mount_path = var.files_directory_mount_path
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
        }
        container {
          name  = var.app_name
          image = var.image
          image_pull_policy = var.image_pull_policy

          port {
            container_port = var.port
          }

          volume_mount {
            name = var.files_directory_name
            mount_path = var.files_directory_mount_path
          }
          volume_mount {
            name = var.nginx_config_name
            mount_path = var.nginx_config_mount_path
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "journal_app_web" {
  metadata {
    name      = var.app_name
  }

  spec {
    selector = {
      app = var.app_name
    }

    port {
      port        = var.port
      target_port = var.port
    }
    type = var.service_type
  }
}

resource "kubernetes_config_map_v1" "nginx_config" {
  metadata {
    name = var.nginx_config_name
  }

  data = {
    "default.conf" = <<-EOT
      server {
        listen 80;
        server_name localhost;
        location / {
          proxy_pass http://journal-app:8000;
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
        }
        location /static/ {
          alias /static-files/;
        }
      }
    EOT
  }
}