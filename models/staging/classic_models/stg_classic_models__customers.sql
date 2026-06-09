<<<<<<< HEAD
       with source as (
       
           select * from {{ source('classic_models', 'customers') }}
       
       ),
       
       renamed as (
       
           select
               customer_number,
               customer_name,
               customer_last_name,
               customer_first_name,
               phone,
               address_line1,
               address_line2,
               city,
               state,
               postal_code,
               country,
               sales_rep_employee_number,
               credit_limit,
               _sync_date
       
           from source
       
       )
       
       select * from renamed
=======
WITH source AS (
    SELECT * FROM {{ source('classic_models', 'customers') }}
),

renamed AS (
    SELECT
        customer_number,
        customer_name,
        customer_last_name,
        customer_first_name,
        phone,
        address_line1,
        address_line2,
        city,
        state,
        postal_code,
        country,
        sales_rep_employee_number,
        credit_limit::FLOAT AS credit_limit,
        _sync_date AS sync_date
    FROM source
)

SELECT * FROM renamed
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
