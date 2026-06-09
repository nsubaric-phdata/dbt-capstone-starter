<<<<<<< HEAD
with products as (
    select * from {{ ref('int_order_details') }}
),

final as (
    select distinct
        {{ dbt_utils.generate_surrogate_key(['product_code']) }}
            as product_pk,
=======
WITH products AS (
    SELECT * FROM {{ ref('stg_classic_models__products') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['product_code']) }} AS product_pk,
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
        product_code,
        product_name,
        product_line,
        product_scale,
        product_vendor,
<<<<<<< HEAD
        product_description
    from products
)

select * from final
=======
        product_description,
        sync_date
    FROM products
)

SELECT * FROM final
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
