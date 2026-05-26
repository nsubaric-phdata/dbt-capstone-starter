       with source as (
       
           select * from {{ source('classic_models', 'payments') }}
       
       ),
       
       renamed as (
       
           select
               customer_number,
               check_number,
               payment_date,
               amount,
               _sync_date
       
           from source
       
       )
       
       select * from renamed