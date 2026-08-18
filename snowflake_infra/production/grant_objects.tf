resource "snowflake_grant_privileges_to_account_role" "dbt_cloud_all_tables_existing" {
  account_role_name = snowflake_account_role.dbt_cloud.name
  privileges        = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database        = "SOLAZ_PROD_DB"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_cloud_all_tables_future" {
  account_role_name = snowflake_account_role.dbt_cloud.name
  privileges        = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = "SOLAZ_PROD_DB"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_cloud_all_views_existing" {
  account_role_name = snowflake_account_role.dbt_cloud.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_database        = "SOLAZ_PROD_DB"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_cloud_all_views_future" {
  account_role_name = snowflake_account_role.dbt_cloud.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = "SOLAZ_PROD_DB"
    }
  }
}


# Airflow objects
resource "snowflake_grant_privileges_to_account_role" "airflow_bronze_tables_existing" {
  account_role_name = snowflake_account_role.airflow.name
  privileges        = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = "SOLAZ_PROD_DB.BRONZE"
    }
  }

  depends_on = [module.prod_database]
}

resource "snowflake_grant_privileges_to_account_role" "airflow_bronze_tables_future" {
  account_role_name = snowflake_account_role.airflow.name
  privileges        = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = "SOLAZ_PROD_DB.BRONZE"
    }
  }

  depends_on = [module.prod_database]
}