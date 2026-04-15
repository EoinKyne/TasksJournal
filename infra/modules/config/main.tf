resource "kubernetes_config_map_v1" "app_config" {
  metadata {
    name      = var.app_name
  }

  data = {
    #DJANGO_SETTINGS_MODULE = "journal-app.settings"
    DEBUG                  = var.DEBUG
    ALLOWED_HOSTS = var.ALLOWED_HOSTS
    DB_HOST =  var.DB_HOST
    DB_PORT = var.DB_PORT
  }
}