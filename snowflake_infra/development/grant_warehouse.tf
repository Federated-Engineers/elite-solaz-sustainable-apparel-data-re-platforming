resource "snowflake_grant_privileges_to_account_role" "analyst_dev_human_wh" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = "SOLAZ_DEV_HUMAN_WH"
  }
}

resource "snowflake_grant_privileges_to_account_role" "engineer_dev_human_wh" {
  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = "SOLAZ_DEV_HUMAN_WH"
  }
}