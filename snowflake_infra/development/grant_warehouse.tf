resource "snowflake_grant_privileges_to_account_role" "analyst_dev_data_team_compute" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = "SOLAZ_DEV_DATA_TEAM_COMPUTE"
  }
}

resource "snowflake_grant_privileges_to_account_role" "engineer_dev_data_team_compute" {
  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = "SOLAZ_DEV_DATA_TEAM_COMPUTE"
  }
}
