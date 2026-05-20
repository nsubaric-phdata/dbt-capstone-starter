with source as (
    select * from {{ source('classic_models', 'inventory_transactions') }}
),

renamed as (
    select
        transaction_id::int         as transaction_id,
        product_code::varchar       as product_code,
        warehouse_code::varchar     as warehouse_code,
        transaction_type::varchar   as transaction_type,
        quantity::int               as quantity,
        transaction_date::date      as transaction_date,
        reference_id::varchar       as reference_id,
        _sync_date::timestamp       as sync_date
    from source
)

select * from renamed