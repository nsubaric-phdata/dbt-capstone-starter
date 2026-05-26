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