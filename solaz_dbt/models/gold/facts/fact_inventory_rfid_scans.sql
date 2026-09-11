with stg_s3__rfid_scans as (
    select
        scan_id
        , sku_id
        , facility_id
        , scan_timestamp
        , scan_type
        , rfid_tag_status

    from {{ ref('stg_s3__rfid_scans') }}
    limit 10 -- noqa: AM09
    -- limited to manage compute
)

, stg_postgres__dim_products as (
    select
        sku_id
        , product_name
        , category
        , upcycled_material_type

    from {{ ref('stg_postgres__dim_products') }}
)

, joined as (
    select
        scans.scan_id
        , scans.sku_id
        , scans.facility_id
        , scans.scan_timestamp
        , scans.scan_type
        , scans.rfid_tag_status
        , products.product_name
        , products.category
        , products.upcycled_material_type

    from stg_s3__rfid_scans as scans
    left join stg_postgres__dim_products as products
        on scans.sku_id = products.sku_id
)

select *
from joined;
