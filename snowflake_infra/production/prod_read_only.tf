resource "snowflake_account_role" "prod_read_only" {
  name = "SOLAZ_PROD_READ_ONLY_ROLE"
}


# Grant db
resource "snowflake_grant_privileges_to_account_role" "prod_read_only_db" {
  account_role_name = snowflake_account_role.prod_read_only.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = "SOLAZ_PROD_DB"
  }
}


# Grant schema
resource "snowflake_grant_privileges_to_account_role" "prod_read_only_schema" {
  account_role_name = snowflake_account_role.prod_read_only.name
  privileges        = ["USAGE"]

  on_schema {
    all_schemas_in_database = "SOLAZ_PROD_DB"
  }
}

resource "snowflake_grant_privileges_to_account_role" "prod_read_only_future_schemas" {
  account_role_name = snowflake_account_role.prod_read_only.name
  privileges        = ["USAGE"]

  on_schema {
    future_schemas_in_database = "SOLAZ_PROD_DB"
  }
}


# Grant objects
resource "snowflake_grant_privileges_to_account_role" "prod_read_only_tables" {
  account_role_name = snowflake_account_role.prod_read_only.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database        = "SOLAZ_PROD_DB"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "prod_read_only_future_tables" {
  account_role_name = snowflake_account_role.prod_read_only.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = "SOLAZ_PROD_DB"
    }
  }
}

# Grant views
resource "snowflake_grant_privileges_to_account_role" "prod_read_only_views" {
  account_role_name = snowflake_account_role.prod_read_only.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_database        = "SOLAZ_PROD_DB"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "prod_read_only_future_views" {
  account_role_name = snowflake_account_role.prod_read_only.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = "SOLAZ_PROD_DB"
    }
  }
}