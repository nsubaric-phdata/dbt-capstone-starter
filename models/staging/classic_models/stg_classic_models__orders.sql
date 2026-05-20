with source as (
    select * from {{ source('classic_models', 'orders') }}
),

renamed as (
    select
        order_number::int       as order_number,
        order_date::date        as order_date,
        required_date::date     as required_date,
        shipped_date::date      as shipped_date,
        status::varchar         as status,
        comments::varchar       as comments,
        customer_number::int    as customer_number,
        _sync_date::timestamp   as sync_date
    from source
)

select * from renamed