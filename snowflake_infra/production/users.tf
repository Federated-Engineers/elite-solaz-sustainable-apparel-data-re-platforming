module "dbt_cloud_user" {
  source = "../modules/users"

  user_name  = "SOLAZ_DBT_CLOUD_PROD_USER"
  login_name = "dbt_cloud@solaz.com"
  password   = data.aws_ssm_parameter.ecs_user_password.value

  default_role      = snowflake_account_role.dbt_cloud.name
  default_warehouse = module.prod_service_compute.compute_name

}

module "airflow_user" {
  source = "../modules/users"

  user_name  = "SOLAZ_AIRFLOW_PROD_USER"
  login_name = "airflow@solaz.com"
  password   = data.aws_ssm_parameter.ecs_user_password.value

  default_role      = snowflake_account_role.airflow.name
  default_warehouse = module.prod_service_compute.compute_name

}