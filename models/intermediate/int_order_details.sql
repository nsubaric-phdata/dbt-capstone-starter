WITH order_details AS (
    SELECT * FROM {{ ref('stg_classic_models__order_details') }}
),

orders AS (
    SELECT * FROM {{ ref('int_orders') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key([
            'o.order_pk', 'od.order_line_number', 'od.product_code'
        ]) }} AS order_detail_pk,
        o.order_pk,
        {{ dbt_utils.generate_surrogate_key(['od.product_code']) }} AS product_pk,
        o.customer_pk,
        od.order_line_number,
        od.product_code,
        od.quantity_ordered,
        od.price_each,
        od.quantity_ordered * od.price_each AS line_total,
        o.order_date,
        od.sync_date
    FROM order_details AS od
    INNER JOIN orders AS o ON od.order_number = o.order_number
)

SELECT * FROM final
