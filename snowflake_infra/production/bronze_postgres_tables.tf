# Three tables from postgres db: dim_customers, dim_products and app_orders

resource "snowflake_table" "dim_customers" {
  database = module.prod_database.database_name
  schema   = module.prod_database.schema_names["BRONZE"]
  name     = "DIM_CUSTOMERS"

  column {
    name = "CUSTOMER_ID"
    type = "VARCHAR"
  }

  column {
    name = "REGISTRATION_DATE"
    type = "TIMESTAMP_NTZ"
  }

  column {
    name = "CUSTOMER_TIER"
    type = "VARCHAR"
  }

  column {
    name = "COUNTRY_CODE"
    type = "VARCHAR"
  }

  column {
    name = "PREFERRED_LANGUAGE"
    type = "VARCHAR"
  }

  column {
    name = "IS_ACTIVE"
    type = "BOOLEAN"
  }

  column {
    name = "LOADED_AT"
    type = "TIMESTAMP_NTZ"
  }
}

resource "snowflake_table" "dim_products" {
  database = module.prod_database.database_name
  schema   = module.prod_database.schema_names["BRONZE"]
  name     = "DIM_PRODUCTS"

  column {
    name = "SKU_ID"
    type = "VARCHAR"
  }

  column {
    name = "PRODUCT_NAME"
    type = "VARCHAR"
  }

  column {
    name = "CATEGORY"
    type = "VARCHAR"
  }

  column {
    name = "UPCYCLED_MATERIAL_TYPE"
    type = "VARCHAR"
  }

  column {
    name = "MANUFACTURING_COST_EUR"
    type = "NUMBER(10,2)"
  }

  column {
    name = "RETAIL_MSRP_EUR"
    type = "NUMBER(10,2)"
  }

  column {
    name = "LOADED_AT"
    type = "TIMESTAMP_NTZ"
  }
}

resource "snowflake_table" "app_orders" {
  database = module.prod_database.database_name
  schema   = module.prod_database.schema_names["BRONZE"]
  name     = "APP_ORDERS"

  column {
    name = "TRANSACTION_ID"
    type = "VARCHAR"
  }

  column {
    name = "SKU_ID"
    type = "VARCHAR"
  }

  column {
    name = "CUSTOMER_ID"
    type = "VARCHAR"
  }

  column {
    name = "TRANSACTION_TIMESTAMP"
    type = "TIMESTAMP_NTZ"
  }

  column {
    name = "SALES_CHANNEL"
    type = "VARCHAR"
  }

  column {
    name = "UNITS_SOLD"
    type = "NUMBER(8,0)"
  }

  column {
    name = "GROSS_REVENUE_EUR"
    type = "NUMBER(10,2)"
  }

  column {
    name = "PROMOTIONAL_DISCOUNT_EUR"
    type = "NUMBER(10,2)"
  }

  column {
    name = "SHRINKAGE_WRITEOFF_EUR"
    type = "NUMBER(10,2)"
  }

  column {
    name = "NET_REVENUE_EUR"
    type = "NUMBER(10,2)"
  }

  column {
    name = "LOADED_AT"
    type = "TIMESTAMP_NTZ"
  }
}