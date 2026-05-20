with source as (
    select * from {{ source('classic_models', 'promotions') }}
),

renamed as (
    select
        promotion_id::int           as promotion_id,
        promotion_name::varchar     as promotion_name,
        product_line::varchar       as product_line,
        discount_pct::float         as discount_pct,
        start_date::date            as start_date,
        end_date::date              as end_date,
        description::varchar        as description,
        _sync_date::timestamp       as sync_date
    from source
)

select * from renamed