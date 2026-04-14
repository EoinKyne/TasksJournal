resource "kubernetes_ingress_v1" "journal_app_ingress" {
  metadata {
    name      = var.app_name
  }

  spec {
    rule {
      http {
        path {
          path     = var.path
          path_type = var.path_type

          backend {
            service {
              name = var.service_name

              port {
                number = var.service_port
              }
            }
          }
        }
      }
    }
  }
}