resource "snowflake_account_role" "dbt_cloud" {
  name = "SOLAZ_DBT_CLOUD_ROLE"
}

resource "snowflake_account_role" "airflow" {
  name = "SOLAZ_AIRFLOW_ROLE"
}
