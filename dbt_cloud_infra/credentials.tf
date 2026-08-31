resource "dbtcloud_snowflake_credential" "dbt_cloud_snowflake_credentials" {
  project_id  = dbtcloud_project.solaz_project.id
  auth_type   = "password"
  num_threads = var.num_threads

  user     = data.terraform_remote_state.snowflake_prod_tfstate.outputs.dbt_cloud_user
  database    = var.snowflake_prod_database
  schema      = "SILVER"
  password_wo = data.aws_ssm_parameter.ecs_user_password.value
}

resource "dbtcloud_snowflake_credential" "slim_ci_snowflake_credentials" {
  project_id  = dbtcloud_project.solaz_project.id
  auth_type   = "password"
  num_threads = var.num_threads

  user     = data.terraform_remote_state.snowflake_prod_tfstate.outputs.dbt_cloud_user
  database    = var.snowflake_prod_database
  schema      = "DBT_CI"
  password_wo = data.aws_ssm_parameter.ecs_user_password.value
}