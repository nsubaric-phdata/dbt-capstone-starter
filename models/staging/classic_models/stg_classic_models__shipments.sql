with source as (
    select * from {{ source('classic_models', 'shipments') }}
),

renamed as (
    select
        shipment_id::int                    as shipment_id,
        order_number::int                   as order_number,
        warehouse_code::varchar             as warehouse_code,
        carrier::varchar                    as carrier,
        tracking_number::varchar            as tracking_number,
        ship_date::date                     as ship_date,
        estimated_delivery_date::date       as estimated_delivery_date,
        actual_delivery_date::date          as actual_delivery_date,
        shipping_cost::float                as shipping_cost,
        _sync_date::timestamp               as sync_date
    from source
)

select * from renamed