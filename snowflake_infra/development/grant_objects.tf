resource "snowflake_grant_privileges_to_account_role" "engineer_gold_and_silver_tables_existing" {
  for_each = local.dev_schemas

  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["SELECT", "INSERT", "UPDATE"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = "SOLAZ_DEV_DB.${each.value}"
    }
  }

  depends_on = [module.dev_database]
}

resource "snowflake_grant_privileges_to_account_role" "engineer_gold_and_silver_tables_future" {
  for_each = local.dev_schemas

  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["SELECT", "INSERT", "UPDATE"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = "SOLAZ_DEV_DB.${each.value}"
    }
  }

  depends_on = [module.prod_database]
}

resource "snowflake_grant_privileges_to_account_role" "engineer_gold_and_silver_views_existing" {
  for_each = local.dev_schemas

  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = "SOLAZ_DEV_DB.${each.value}"
    }
  }

  depends_on = [module.prod_database]
}

resource "snowflake_grant_privileges_to_account_role" "engineer_gold_and_silver_views_future" {
  for_each = local.dev_schemas

  account_role_name = snowflake_account_role.engineer.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_schema          = "SOLAZ_DEV_DB.${each.value}"
    }
  }

  depends_on = [module.prod_database]
}


# Analyst Objects
resource "snowflake_grant_privileges_to_account_role" "analyst_gold_tables_existing" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["SELECT", "INSERT", "UPDATE"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = "SOLAZ_DEV_DB.GOLD"
    }
  }

  depends_on = [module.prod_database]
}

resource "snowflake_grant_privileges_to_account_role" "analyst_gold_tables_future" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["SELECT", "INSERT", "UPDATE"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = "SOLAZ_DEV_DB.GOLD"
    }
  }

  depends_on = [module.prod_database]
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

  depends_on = [module.prod_database]
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
  
  depends_on = [module.prod_database]
}