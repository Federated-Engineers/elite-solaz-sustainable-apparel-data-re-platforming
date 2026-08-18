resource "snowflake_grant_account_role" "analyst_to_user" {
  role_name = snowflake_account_role.analyst.name
  user_name = module.analyst_user.user_name
}

resource "snowflake_grant_account_role" "engineer_to_user" {
  role_name = snowflake_account_role.engineer.name
  user_name = module.engineer_user.user_name
}

# Analyst and Engineer Roles inherit from Prod Read Only Role
resource "snowflake_grant_account_role" "prod_read_only_to_engineer" {
  role_name        = var.prod_read_only_role_name
  parent_role_name = snowflake_account_role.engineer.name
}

resource "snowflake_grant_account_role" "prod_read_only_to_analyst" {
  role_name        = var.prod_read_only_role_name
  parent_role_name = snowflake_account_role.analyst.name
}

# Platform Role inherits from Analyst and Engineer Roles
resource "snowflake_grant_account_role" "engineer_to_parent_platform" {
  role_name        = snowflake_account_role.engineer.name
  parent_role_name = snowflake_account_role.platform.name
}

resource "snowflake_grant_account_role" "analyst_to_parent_platform" {
  role_name        = snowflake_account_role.analyst.name
  parent_role_name = snowflake_account_role.platform.name
}

