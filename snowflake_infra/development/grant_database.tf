resource "snowflake_grant_privileges_to_account_role" "engineer_use_prod_db" {
  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = "SOLAZ_PROD_DB"
  }
}

resource "snowflake_grant_privileges_to_account_role" "analyst_use_prod_db" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = "SOLAZ_PROD_DB"
  }
}