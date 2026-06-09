<<<<<<< HEAD
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
=======
WITH products AS (
    SELECT * FROM {{ ref('stg_classic_models__products') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['product_code']) }} AS product_pk,
        quantity_in_stock,
        buy_price,
        msrp,
        sync_date
    FROM products
)

SELECT * FROM final
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
