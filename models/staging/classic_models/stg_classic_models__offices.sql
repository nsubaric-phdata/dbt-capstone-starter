<<<<<<< HEAD
       with source as (
       
           select * from {{ source('classic_models', 'offices') }}
       
       ),
       
       renamed as (
       
           select
               office_code,
               city,
               phone,
               address_line1,
               address_line2,
               state,
               country,
               postal_code,
               territory,
               _sync_date
       
           from source
       
       )
       
       select * from renamed
=======
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
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
