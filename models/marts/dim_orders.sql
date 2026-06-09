<<<<<<< HEAD
with orders as (
    select * from {{ ref('int_orders') }}
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['order_number']) }}
            as order_pk,
        order_number,
=======
WITH orders AS (
    SELECT * FROM {{ ref('int_orders') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['order_number']) }} AS order_pk,
        order_date,
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
        required_date,
        shipped_date,
        status,
        comments
<<<<<<< HEAD
    from orders
)

select * from final
=======
    FROM orders
)

SELECT * FROM final
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
