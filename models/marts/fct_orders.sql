WITH order_details AS (
    SELECT * FROM {{ ref('int_order_details') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['order_pk', 'order_line_number', 'product_code']) }} AS order_line_pk,
        order_pk,
        product_pk,
        customer_pk,
        order_line_number,
        product_code,
        quantity_ordered,
        price_each,
        line_total,
        order_date,
        sync_date
    FROM order_details
)

SELECT * FROM final
