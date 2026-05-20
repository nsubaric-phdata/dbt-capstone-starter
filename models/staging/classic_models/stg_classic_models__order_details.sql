with source as (
    select * from {{ source('classic_models', 'order_details') }}
),

renamed as (
    select
        order_number::int           as order_number,
        product_code::varchar       as product_code,
        quantity_ordered::int       as quantity_ordered,
        price_each::float           as price_each,
        order_line_number::int      as order_line_number,
        _sync_date::timestamp       as sync_date
    from source
)

select * from renamed