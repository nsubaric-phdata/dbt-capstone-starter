with source as (
    select * from {{ source('classic_models', 'offices') }}
),

renamed as (
    select
        office_code::varchar    as office_code,
        city::varchar           as city,
        phone::varchar          as phone,
        address_line1::varchar  as address_line1,
        address_line2::varchar  as address_line2,
        state::varchar          as state,
        country::varchar        as country,
        postal_code::varchar    as postal_code,
        territory::varchar      as territory,
        _sync_date::timestamp   as sync_date
    from source
)

select * from renamed