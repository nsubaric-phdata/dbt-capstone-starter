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
