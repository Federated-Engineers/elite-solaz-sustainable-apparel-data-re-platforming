with customers as (
    select
        customer_id
        , registration_date as registration_timestamp
        , registration_date::date as registration_date
        , registration_date::time as registration_time
        , customer_tier
        , country_code
        , preferred_language
        , is_active
        , loaded_at

    from {{ source('postgres', 'dim_customers') }}

)

select distinct *
from customers
