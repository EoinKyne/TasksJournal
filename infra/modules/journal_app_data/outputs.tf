output "service_name" {
  value = kubernetes_service_v1.journal_app_data_headless.metadata[0].name
}