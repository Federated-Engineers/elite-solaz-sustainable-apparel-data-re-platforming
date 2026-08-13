resource "snowflake_grant_privileges_to_account_role" "dbt_cloud_use_prod_db" {
  account_role_name = snowflake_account_role.dbt_cloud.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = "SOLAZ_PROD_DB"
  }
}

resource "snowflake_grant_privileges_to_account_role" "airflow_use_prod_db" {
  account_role_name = snowflake_account_role.airflow.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = "SOLAZ_PROD_DB"
  }
}