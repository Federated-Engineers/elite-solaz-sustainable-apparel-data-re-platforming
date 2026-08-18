resource "snowflake_grant_privileges_to_account_role" "dbt_cloud_all_schema" {
  account_role_name = snowflake_account_role.dbt_cloud.name
  privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW"]

  on_schema {
    all_schemas_in_database = "SOLAZ_PROD_DB"
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_cloud_all_schema_future" {
  account_role_name = snowflake_account_role.dbt_cloud.name
  privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW"]

  on_schema {
    future_schemas_in_database = "SOLAZ_PROD_DB"
  }
}

resource "snowflake_grant_privileges_to_account_role" "airflow_bronze_schema" {
  account_role_name = snowflake_account_role.airflow.name
  privileges        = ["USAGE"]

  on_schema {
    schema_name = "SOLAZ_PROD_DB.BRONZE"
  }

  depends_on = [module.prod_database]
}