WITH orders AS (
    SELECT * FROM {{ ref('stg_classic_models__orders') }}
),

customers AS (
    SELECT
        customer_number,
        customer_name,
        sales_rep_employee_number
    FROM {{ ref('stg_classic_models__customers') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['o.order_number']) }} AS order_pk,
        {{ dbt_utils.generate_surrogate_key(['o.customer_number']) }} AS customer_pk,
        o.order_number,
        o.order_date,
        o.required_date,
        o.shipped_date,
        o.status,
        o.comments,
        o.customer_number,
        c.customer_name,
        c.sales_rep_employee_number,
        o.sync_date
    FROM orders AS o
    INNER JOIN customers AS c ON o.customer_number = c.customer_number
)

SELECT * FROM final
