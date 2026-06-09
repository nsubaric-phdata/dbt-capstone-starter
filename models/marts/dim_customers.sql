<<<<<<< HEAD
with customers as (
    select * from {{ ref('stg_classic_models__customers') }}
),

employees as (
    select * from {{ ref('stg_classic_models__employees') }}
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['c.customer_number']) }}
            as customer_pk,
        c.customer_number,
        c.customer_name,
        c.customer_last_name,
        c.customer_first_name,
        c.sales_rep_employee_number,
        c.credit_limit,
        c.phone,
        c.address_line1,
        c.address_line2,
        c.city,
        c.state,
        c.postal_code,
        c.country
    from customers c
    left join employees e
        on c.sales_rep_employee_number = e.employee_number
)

select * from final
=======
WITH customers AS (
    SELECT * FROM {{ ref('stg_classic_models__customers') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['customer_number']) }} AS customer_pk,
        customer_number,
        customer_name,
        customer_last_name,
        customer_first_name,
        sales_rep_employee_number,
        credit_limit,
        phone,
        address_line1,
        address_line2,
        city,
        state,
        postal_code,
        country,
        sync_date
    FROM customers
)

SELECT * FROM final
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
