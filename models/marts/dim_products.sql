WITH products AS (
    SELECT * FROM {{ ref('stg_classic_models__products') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['product_code']) }} AS product_pk,
        product_code,
        product_name,
        product_line,
        product_scale,
        product_vendor,
        product_description,
        sync_date
    FROM products
)

SELECT * FROM final
