with orders as (
    select * from {{ ref('stg_classic_models__orders') }}
),

customers as (
    select * from {{ ref('stg_classic_models__customers') }}
),

joined as (
    select
        o.order_number,
        o.order_date,
        o.required_date,
        o.shipped_date,
        o.status,
        o.comments,
        o.customer_number,
        c.customer_name,
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