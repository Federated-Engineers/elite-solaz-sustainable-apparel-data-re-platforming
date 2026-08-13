resource "snowflake_grant_privileges_to_account_role" "engineer_gold_tables_existing" {
  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = "SOLAZ_DEV_DB.GOLD"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "engineer_gold_tables_future" {
  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = "SOLAZ_DEV_DB.GOLD"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "engineer_gold_views_existing" {
  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = "SOLAZ_DEV_DB.GOLD"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "engineer_gold_views_future" {
  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_schema          = "SOLAZ_DEV_DB.GOLD"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "engineer_silver_tables_existing" {
  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = "SOLAZ_DEV_DB.SILVER"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "engineer_silver_tables_future" {
  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = "SOLAZ_DEV_DB.SILVER"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "engineer_silver_views_existing" {
  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = "SOLAZ_DEV_DB.SILVER"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "engineer_silver_views_future" {
  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_schema          = "SOLAZ_DEV_DB.SILVER"
    }
  }
}


# Analyst Objects
resource "snowflake_grant_privileges_to_account_role" "analyst_gold_tables_existing" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = "SOLAZ_DEV_DB.GOLD"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "analyst_gold_tables_future" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = "SOLAZ_DEV_DB.GOLD"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "analyst_gold_views_existing" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = "SOLAZ_DEV_DB.GOLD"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "analyst_gold_views_future" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_schema          = "SOLAZ_DEV_DB.GOLD"
    }
  }
}