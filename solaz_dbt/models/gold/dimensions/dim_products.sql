with stg_postgres__dim_products as (
    select
        sku_id
        , product_name
        , category
        , upcycled_material_type
        , manufacturing_cost_eur
        , retail_msrp_eur

    from {{ ref('stg_postgres__dim_products') }}
)

select *
from stg_postgres__dim_products
