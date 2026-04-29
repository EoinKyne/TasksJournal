variable "apps_secrets" {
  description = "A map of application secrets to deploy as Secrets"
  type        = map(object({
    app_name = string
    namespace = string
    postgres_db = string
    postgres_user = string
    postgres_password = string
    secret_key = string
  }))
}

variable "apps_database" {
  description = "A map of database applications to deploy"
  type        = map(object({
    app_name = string
    namespace = string
    image = string
    image_pull_policy = string
    replicas = number
    container_port = number
    container_name = string

    service_name = string
    cluster_ip = string

    secret_name = string
    db_name_key = string
    db_user_key = string
    db_password_key = string

    storage_name = string
    storage_access_mode = string
    storage_size = string
    storage_path = string
    storage_env_name = string
    storage_env_value = string
    storage_class_name = string

    readiness_probe_initial_delay_seconds = number
    readiness_probe_period_seconds = number
    }))
}