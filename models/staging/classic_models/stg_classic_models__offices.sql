WITH source AS (
    SELECT * FROM {{ source('classic_models', 'offices') }}
),

renamed AS (
    SELECT
        office_code,
        city,
        phone,
        address_line1,
        address_line2,
        state,
        country,
        postal_code,
        territory,
        _sync_date AS sync_date
    FROM source
)

SELECT * FROM renamed
