<<<<<<< HEAD
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
=======
WITH payments AS (
    SELECT * FROM {{ ref('stg_classic_models__payments') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['customer_number', 'check_number']) }} AS payment_pk,
        {{ dbt_utils.generate_surrogate_key(['customer_number']) }} AS customer_pk,
        check_number,
        payment_date,
        amount,
        sync_date
    FROM payments
)

SELECT * FROM final
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
