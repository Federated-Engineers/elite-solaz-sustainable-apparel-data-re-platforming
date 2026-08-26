resource "snowflake_grant_account_role" "dbt_cloud_to_user" {
  role_name = snowflake_account_role.dbt_cloud.name
  user_name = module.dbt_cloud_user.user_name
}

resource "snowflake_grant_account_role" "airflow_to_user" {
  role_name = snowflake_account_role.airflow.name
  user_name = module.airflow_user.user_name
}