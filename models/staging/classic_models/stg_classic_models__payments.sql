WITH source AS (
    SELECT * FROM {{ source('classic_models', 'payments') }}
),

renamed AS (
    SELECT
        customer_number,
        check_number,
        payment_date::DATE AS payment_date,
        amount::FLOAT AS amount,
        _sync_date AS sync_date
    FROM source
)

SELECT * FROM renamed
