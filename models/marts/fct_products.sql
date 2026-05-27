with products as (
    select * from {{ ref('stg_classic_models__products') }}
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['product_code']) }}
            as product_pk,
        quantity_in_stock,
        buy_price,
        msrp
    from products
)

select * from final