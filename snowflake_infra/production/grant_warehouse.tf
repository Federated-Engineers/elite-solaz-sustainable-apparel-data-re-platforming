resource "snowflake_grant_privileges_to_account_role" "dbt_cloud_prod_service_wh" {
  account_role_name = snowflake_account_role.dbt_cloud.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = "SOLAZ_PROD_SERVICE_WH"
  }
}

resource "snowflake_grant_privileges_to_account_role" "airflow_prod_service_wh" {
  account_role_name = snowflake_account_role.airflow.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = "SOLAZ_PROD_SERVICE_WH"
  }
}