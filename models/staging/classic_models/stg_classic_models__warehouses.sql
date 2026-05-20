with source as (
    select * from {{ source('classic_models', 'warehouses') }}
),

renamed as (
    select
        warehouse_code::varchar     as warehouse_code,
        warehouse_name::varchar     as warehouse_name,
        address_line1::varchar      as address_line1,
        city::varchar               as city,
        state::varchar              as state,
        country::varchar            as country,
        postal_code::varchar        as postal_code,
        capacity::int               as capacity,
        _sync_date::timestamp       as sync_date
    from source
)

select * from renamed