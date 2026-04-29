module "secrets" {
  source = "../../modules/secrets"
  for_each = var.apps_secrets
    app_name = each.value.app_name
    namespace = each.value.namespace
    postgres_db = each.value.postgres_db
    postgres_user = each.value.postgres_user
    postgres_password = each.value.postgres_password
    secret_key = var.secret_key
}

module "journal_app_data" {
  source = "../../modules/journal_app_data"
  for_each = var.apps_database
    app_name = each.value.app_name
    namespace = each.value.namespace
    image = each.value.image
    image_pull_policy = each.value.image_pull_policy
    replicas = each.value.replicas
    container_name = each.value.container_name
    container_port = each.value.container_port

    service_name = each.value.service_name
    cluster_ip = each.value.cluster_ip

    secret_name = each.value.secret_name
    db_name_key = each.value.db_name_key
    db_user_key = each.value.db_user_key
    db_password_key = each.value.db_password_key

    storage_name = each.value.storage_name
    storage_access_mode = each.value.storage_access_mode
    storage_size = each.value.storage_size
    storage_path = each.value.storage_path
    storage_env_name = each.value.storage_env_name
    storage_env_value = each.value.storage_env_value
    storage_class_name = each.value.storage_class_name

    readiness_probe_initial_delay_seconds = each.value.readiness_probe_initial_delay_seconds
    readiness_probe_period_seconds = each.value.readiness_probe_period_seconds
}