<<<<<<< HEAD
with orders as (
    select * from {{ ref('stg_classic_models__orders') }}
),

customers as (
    select * from {{ ref('stg_classic_models__customers') }}
),

joined as (
    select
=======
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
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
        o.order_number,
        o.order_date,
        o.required_date,
        o.shipped_date,
        o.status,
        o.comments,
        o.customer_number,
        c.customer_name,
<<<<<<< HEAD
        c.customer_last_name,
        c.customer_first_name,
        c.phone,
        c.address_line1,
        c.address_line2,
        c.city,
        c.state,
        c.postal_code,
        c.country,
        c.sales_rep_employee_number,
        c.credit_limit
    from orders o
    left join customers c
        on o.customer_number = c.customer_number
)

select * from joined
=======
        c.sales_rep_employee_number,
        o.sync_date
    FROM orders AS o
    INNER JOIN customers AS c ON o.customer_number = c.customer_number
)

SELECT * FROM final
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
