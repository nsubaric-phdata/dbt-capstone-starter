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