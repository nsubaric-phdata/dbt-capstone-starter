<<<<<<< HEAD
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
=======
WITH source AS (
    SELECT * FROM {{ source('classic_models', 'orders') }}
),

renamed AS (
    SELECT
        order_number,
        order_date::DATE AS order_date,
        required_date::DATE AS required_date,
        shipped_date::DATE AS shipped_date,
        status,
        comments,
        customer_number,
        _sync_date AS sync_date
    FROM source
)

SELECT * FROM renamed
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
