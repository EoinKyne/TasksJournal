resource "kubernetes_ingress_v1" "journal_app_ingress" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
  }

  spec {
    rule {
      host = var.host
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