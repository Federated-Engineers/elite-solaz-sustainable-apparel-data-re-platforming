with products as (
    select
        sku_id
        , product_name
        , category
        , upcycled_material_type
        , manufacturing_cost_eur
        , retail_msrp_eur
        , loaded_at

    from {{ source('postgres', 'dim_products') }}
)

select distinct *
from products
