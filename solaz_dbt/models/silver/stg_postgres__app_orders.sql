with app_orders as (
    select
        transaction_id
        , sku_id
        , customer_id
        , transaction_timestamp
        , transaction_timestamp::date as transaction_date
        , transaction_timestamp::time as transaction_time
        , sales_channel
        , units_sold
        , gross_revenue_eur
        , promotional_discount_eur
        , shrinkage_writeoff_eur
        , net_revenue_eur
        , loaded_at

    from {{ source('postgres', 'app_orders') }}
)

select distinct *
from app_orders
