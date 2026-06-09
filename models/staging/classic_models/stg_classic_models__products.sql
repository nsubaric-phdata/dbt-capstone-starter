<<<<<<< HEAD
       with source as (
       
           select * from {{ source('classic_models', 'products') }}
       
       ),
       
       renamed as (
       
           select
               product_code,
               product_name,
               product_line,
               product_scale,
               product_vendor,
               product_description,
               quantity_in_stock,
               buy_price,
               msrp,
               _sync_date
       
           from source
       
       )
       
       select * from renamed
=======
WITH source AS (
    SELECT * FROM {{ source('classic_models', 'products') }}
),

renamed AS (
    SELECT
        product_code,
        product_name,
        product_line,
        product_scale,
        product_vendor,
        product_description,
        quantity_in_stock,
        buy_price::FLOAT AS buy_price,
        msrp::FLOAT AS msrp,
        _sync_date AS sync_date
    FROM source
)

SELECT * FROM renamed
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
