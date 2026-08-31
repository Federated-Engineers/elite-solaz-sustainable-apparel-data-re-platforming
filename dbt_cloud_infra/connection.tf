resource "dbtcloud_global_connection" "dbt_cloud_snowflake_connection" {
  name = "Solaz Snowflake"

  snowflake = {
    account   = var.snowflake_account
    database  = var.snowflake_prod_database
    warehouse = var.snowflake_service_compute

    role = "SOLAZ_DBT_CLOUD_ROLE"
  }
}