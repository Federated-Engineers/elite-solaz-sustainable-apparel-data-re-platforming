with telemetry_data as (
    select
        scan_id
        , sku_id
        , facility_id
        , scan_timestamp
        , scan_type
        , rfid_tag_status
        , year
        , month
        , day

    from {{ source('s3', 'rfid_scans') }}
)

select distinct *
from telemetry_data
