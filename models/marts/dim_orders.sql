WITH orders AS (
    SELECT * FROM {{ ref('int_orders') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['order_number']) }} AS order_pk,
        order_date,
        required_date,
        shipped_date,
        status,
        comments
    FROM orders
)

SELECT * FROM final
