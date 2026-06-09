<<<<<<< HEAD
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
=======
WITH source AS (
    SELECT * FROM {{ source('classic_models', 'payments') }}
),

renamed AS (
    SELECT
        customer_number,
        check_number,
        payment_date::DATE AS payment_date,
        amount::FLOAT AS amount,
        _sync_date AS sync_date
    FROM source
)

SELECT * FROM renamed
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
