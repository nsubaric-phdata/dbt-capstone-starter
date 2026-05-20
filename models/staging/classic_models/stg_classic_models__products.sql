with source as (
    select * from {{ source('classic_models', 'products') }}
),

renamed as (
    select
        product_code::varchar       as product_code,
        product_name::varchar       as product_name,
        product_line::varchar       as product_line,
        product_scale::varchar      as product_scale,
        product_vendor::varchar     as product_vendor,
        product_description::varchar as product_description,
        quantity_in_stock::int      as quantity_in_stock,
        buy_price::float            as buy_price,
        msrp::float                 as msrp,
        _sync_date::timestamp       as sync_date
    from source
)

select * from renamed