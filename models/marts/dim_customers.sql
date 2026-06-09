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
