resource "snowflake_account_role" "analyst" {
  name = "SOLAZ_ANALYST_ROLE"
}

resource "snowflake_account_role" "engineer" {
  name = "SOLAZ_ENGINEER_ROLE"
}

resource "snowflake_account_role" "platform" {
  name = "SOLAZ_PLATFORM_ROLE"
}