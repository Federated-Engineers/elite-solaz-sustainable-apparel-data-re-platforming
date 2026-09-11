with stg_postgres__dim_customers as (
    select
        customer_id
        , registration_date
        , customer_tier
        , country_code
        , preferred_language
        , is_active
        , loaded_at

    from {{ ref('stg_postgres__dim_customers') }}

)

select distinct *
from stg_postgres__dim_customers
