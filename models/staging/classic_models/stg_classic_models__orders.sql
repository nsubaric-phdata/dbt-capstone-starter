WITH source AS (
    SELECT * FROM {{ source('classic_models', 'orders') }}
),

renamed AS (
    SELECT
        order_number,
        order_date::DATE AS order_date,
        required_date::DATE AS required_date,
        shipped_date::DATE AS shipped_date,
        status,
        comments,
        customer_number,
        _sync_date AS sync_date
    FROM source
)

SELECT * FROM renamed
