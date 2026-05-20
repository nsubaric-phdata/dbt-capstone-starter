with source as (
    select * from {{ source('classic_models', 'returns') }}
),

renamed as (
    select
        return_id::int              as return_id,
        order_number::int           as order_number,
        product_code::varchar       as product_code,
        quantity_returned::int      as quantity_returned,
        return_date::date           as return_date,
        reason::varchar             as reason,
        refund_amount::float        as refund_amount,
        status::varchar             as status,
        _sync_date::timestamp       as sync_date
    from source
)

select * from renamed