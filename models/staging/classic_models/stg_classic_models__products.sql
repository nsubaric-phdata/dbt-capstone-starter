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