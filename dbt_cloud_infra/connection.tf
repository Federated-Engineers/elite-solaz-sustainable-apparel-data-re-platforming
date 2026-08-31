resource "dbtcloud_global_connection" "dbt_cloud_snowflake_connection" {
  name = "Solaz Snowflake"

  snowflake = {
    account   = var.snowflake_account
    database  = var.snowflake_prod_database
    warehouse = var.snowflake_service_compute
    role      = data.terraform_remote_state.snowflake_prod_tfstate.outputs.dbt_cloud_role
  }
}