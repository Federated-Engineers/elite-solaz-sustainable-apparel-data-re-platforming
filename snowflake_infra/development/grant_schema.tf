resource "snowflake_grant_privileges_to_account_role" "analyst_gold_schema" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW"]

  on_schema {
    schema_name = "SOLAZ_DEV_DB.GOLD"
  }
}

resource "snowflake_grant_privileges_to_account_role" "engineer_gold_schema" {
  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW"]

  on_schema {
    schema_name = "SOLAZ_DEV_DB.GOLD"
  }
}

resource "snowflake_grant_privileges_to_account_role" "engineer_silver_schema" {
  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW"]

  on_schema {
    schema_name = "SOLAZ_DEV_DB.SILVER"
  }
}