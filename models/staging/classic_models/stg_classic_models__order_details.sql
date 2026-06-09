<<<<<<< HEAD
       with source as (
       
           select * from {{ source('classic_models', 'order_details') }}
       
       ),
       
       renamed as (
       
           select
               order_number,
               product_code,
               quantity_ordered,
               price_each,
               order_line_number,
               _sync_date
       
           from source
       
       )
       
       select * from renamed
=======
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
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
