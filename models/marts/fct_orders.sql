with orders as (
    select * from {{ ref('int_orders') }}
),

order_details as (
    select * from {{ ref('int_order_details') }}
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['od.order_number', 'od.product_code', 'od.order_line_number']) }}
            as order_pk,
        {{ dbt_utils.generate_surrogate_key(['od.product_code']) }}
            as product_pk,
        {{ dbt_utils.generate_surrogate_key(['o.customer_number']) }}
            as customer_pk,
        od.order_line_number,
        od.product_code,
        od.quantity_ordered,
        od.price_each
    from order_details od
    left join orders o
        on od.order_number = o.order_number
)

select * from final