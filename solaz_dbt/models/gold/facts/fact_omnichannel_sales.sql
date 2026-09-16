with stg_postgres__app_orders as (
    select
        transaction_id
        , sku_id
        , customer_id
        , transaction_timestamp
        , sales_channel
        , units_sold
        , gross_revenue_eur
        , promotional_discount_eur
        , shrinkage_writeoff_eur
        , net_revenue_eur

    from {{ ref('stg_postgres__app_orders') }}
)

, stg_gsheets__orders as (
    select
        transaction_id
        , sku_id
        , customer_id
        , transaction_timestamp
        , sales_channel
        , units_sold
        , gross_revenue_eur
        , promotional_discount_eur
        , shrinkage_writeoff_eur
        , net_revenue_eur

    from {{ ref('stg_gsheets__orders') }}
)

, reconciled as (
    select *
    from stg_postgres__app_orders

    union all

    select *
    from stg_gsheets__orders
)

select *
from reconciled
