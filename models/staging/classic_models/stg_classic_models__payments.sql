with source as (
    select * from {{ source('classic_models', 'payments') }}
),

renamed as (
    select
        customer_number::int    as customer_number,
        check_number::varchar   as check_number,
        payment_date::date      as payment_date,
        amount::float           as amount,
        _sync_date::timestamp   as sync_date
    from source
)

select * from renamed