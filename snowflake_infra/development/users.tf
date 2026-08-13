module "engineer_user" {
  source = "../modules/users"

  user_name = "SOLAZ_ENGINEER_DEV_USER"
  login_name = "engineer@solaz.com"
  password  = data.aws_ssm_parameter.engineer_user_password.value

  default_role      = snowflake_account_role.engineer.name
  default_warehouse = module.dev_human_wh.wh_name

}

module "analyst_user" {
  source = "../modules/users"

  user_name = "SOLAZ_ANALYST_DEV_USER"
  login_name = "analyst@solaz.com"
  password  = data.aws_ssm_parameter.analyst_user_password.value

  default_role      = snowflake_account_role.analyst.name
  default_warehouse = module.dev_human_wh.wh_name

}