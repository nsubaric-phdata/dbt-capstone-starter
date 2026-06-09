<<<<<<< HEAD
       with source as (
       
           select * from {{ source('classic_models', 'product_lines') }}
       
       ),
       
       renamed as (
       
           select
               product_line,
               text_description,
               html_description,
               image,
               _sync_date
       
           from source
       
       )
       
       select * from renamed
=======
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
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
