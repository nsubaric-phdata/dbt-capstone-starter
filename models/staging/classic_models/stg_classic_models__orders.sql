       with source as (
       
           select * from {{ source('classic_models', 'orders') }}
       
       ),
       
       renamed as (
       
           select
               order_number,
               order_date,
               required_date,
               shipped_date,
               status,
               comments,
               customer_number,
               _sync_date
       
           from source
       
       )
       
       select * from renamed