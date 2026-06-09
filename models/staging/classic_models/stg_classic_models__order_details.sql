WITH source AS (
    SELECT * FROM {{ source('classic_models', 'order_details') }}
),

renamed AS (
    SELECT
        order_number,
        product_code,
        quantity_ordered,
        price_each::FLOAT AS price_each,
        order_line_number,
        _sync_date AS sync_date
    FROM source
)

SELECT * FROM renamed
