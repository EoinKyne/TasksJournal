apps_secrets = {
  "app-secrets" = {
    "app_name" = "app-secrets"
    "namespace" = "default"
  }
}

apps_database = {
  "journal_app_data" = {
    "app_name" = "journal-app-data"
    "namespace" = "default"
    "image" = "postgres:15"
    "image_pull_policy" = "Always"
    "replicas" = 1
    "container_name" = "postgres"
    "container_port" = 5432

    "service_name" = "journal-app-data-headless"
    "cluster_ip" = "None"

    "secret_name" = "app-secrets"
    "db_name_key" = "POSTGRES_DB"
    "db_user_key" = "POSTGRES_USER"
    "db_password_key" = "POSTGRES_PASSWORD"

    "storage_name" = "postgres-storage"
    "storage_access_mode" = "ReadWriteOnce"
    "storage_size" = "1Gi"
    "storage_path" = "/var/lib/postgresql/data"
    "storage_env_name" = "PGDATA"
    "storage_env_value" = "/var/lib/postgresql/data/pgdata"
    "storage_class_name" = "standard"

    "readiness_probe_initial_delay_seconds" = 10
    "readiness_probe_period_seconds" = 5
  }
}