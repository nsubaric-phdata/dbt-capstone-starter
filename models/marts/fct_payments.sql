with payments as (
    select * from {{ ref('stg_classic_models__payments') }}
),

customers as (
    select * from {{ ref('stg_classic_models__customers') }}
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['p.customer_number']) }}
            as customer_pk,
        p.check_number,
        p.payment_date,
        p.amount
    from payments p
    left join customers c
        on p.customer_number = c.customer_number
)

select * from final