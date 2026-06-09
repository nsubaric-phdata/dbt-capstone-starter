WITH source AS (
    SELECT * FROM {{ source('classic_models', 'product_lines') }}
),

renamed AS (
    SELECT
        product_line,
        text_description,
        _sync_date AS sync_date
    FROM source
)

SELECT * FROM renamed
