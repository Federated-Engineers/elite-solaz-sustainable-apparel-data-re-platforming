select
    customer_id,
    units_sold
from solaz_prod_db.bronze.app_orders
order by units_sold desc
limit 10
