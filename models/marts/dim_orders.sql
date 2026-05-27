with orders as (
    select * from {{ ref('int_orders') }}
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['order_number']) }}
            as order_pk,
        order_number,
        required_date,
        shipped_date,
        status,
        comments
    from orders
)

select * from final