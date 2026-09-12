with dim_customers as (
    select
        customer_id
        , customer_tier

    from {{ ref('dim_customers') }}
)

, fact_omnichannel_sales as (
    select
        customer_id
        , sku_id
        , transaction_timestamp
        , sales_channel
        , units_sold
        , net_revenue_eur

    from {{ ref('fact_omnichannel_sales') }}
)

, fact_inventory_rfid_scans as (
    select
        sku_id
        , product_name
        , category
        , manufacturing_cost_eur

    from {{ ref('fact_inventory_rfid_scans') }}
)

-- joins all tables to provide daily unit economics, stock velocity, and
-- true margin analysis across every product line and sales channel.

, joined_sales_and_inventory as (
    select
        customers.customer_id
        , customers.customer_tier
        , sales.sku_id
        , sales.transaction_timestamp
        , sales.sales_channel
        , sales.units_sold
        , sales.net_revenue_eur
        , inventory.product_name
        , inventory.category
        , inventory.manufacturing_cost_eur

    from dim_customers as customers
    inner join fact_omnichannel_sales as sales
        on customers.customer_id = sales.customer_id
    inner join fact_inventory_rfid_scans as inventory
        on sales.sku_id = inventory.sku_id
)

, final_table as (
    select
        transaction_timestamp
        , sku_id
        , category
        , sales_channel
        , product_name
        , customer_tier
        , sum(units_sold) as total_units_sold
        , sum(net_revenue_eur) as total_net_revenue_eur
        , sum(total_units_sold * manufacturing_cost_eur)
            as total_manufacturing_cost_eur

        , case
            when total_net_revenue_eur = 0 then 0
            else (
                (total_net_revenue_eur - total_manufacturing_cost_eur)
                / total_net_revenue_eur
            ) * 100
        end as net_profit_margin_percentage

    from joined_sales_and_inventory
    group by
        transaction_timestamp
        , sku_id
        , category
        , sales_channel
        , product_name
        , customer_tier
    order by transaction_timestamp
)

select *
from final_table
