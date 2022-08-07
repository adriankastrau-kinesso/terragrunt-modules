terraform {
  backend "s3" {}
  required_version = ">= 1.2.0"

  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.40.0"
    }
  }
}

provider "snowflake" {
    alias = "service_account"
    role = var.user_role_name
}

resource "snowflake_database" "db" {
    count = var.create_db ?  1 : 0
    name = var.db_name
}

resource "snowflake_warehouse" "warehouse" {
    count = var.create_wh ? 1 : 0
    name = var.wh_name
    warehouse_size = var.wh_size
    min_cluster_count = var.min_wh_size
    max_cluster_count = var.max_wh_size

    auto_suspend = 60
    initially_suspended = true
    auto_resume = true
}

resource "snowflake_schema" "schema" {
    count = var.create_schema ? 1 : 0
    database = var.schema_db_name
    name = var.schema_name

    is_transient = false
    is_managed = false
    data_retention_days = 1
}

resource "snowflake_role" "role" {
    count = var.create_role ? 1 : 0
    name  = var.role_name
}

resource "snowflake_role_grants" "grants" {
    count = var.create_role_grants ? 1 : 0
    role_name = var.role_grants_role_name
    roles = var.role_grants_roles
    users = var.role_grants_users
}

resource snowflake_database_grant grant {
    count = var.create_database_grant ? 1 : 0
    database_name = var.database_grant_database_name
    privilege = var.database_grant_privilege
    roles = var.database_grant_roles

    with_grant_option = false
}

resource snowflake_warehouse_grant grant {
    count = var.create_warehouse_grant ? 1 : 0
    warehouse_name = var.warehouse_grant_warehouse_name
    privilege = var.warehouse_grant_privilege
    roles = var.warehouse_grant_roles

    with_grant_option = false
}
