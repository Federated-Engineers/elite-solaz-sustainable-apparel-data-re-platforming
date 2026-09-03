SELECT
    customer_id,
    units_sold
FROM solaz_prod_db.bronze.app_orders
ORDER BY units_sold DESC
LIMIT 10
