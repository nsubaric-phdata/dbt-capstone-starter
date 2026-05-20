with source as (
    select * from {{ source('classic_models', 'customers') }}
),

renamed as (
    select
        customer_number::int         as customer_number,
        customer_name::varchar       as customer_name,
        customer_last_name::varchar  as customer_last_name,
        customer_first_name::varchar as customer_first_name,
        phone::varchar               as phone,
        address_line1::varchar       as address_line1,
        address_line2::varchar       as address_line2,
        city::varchar                as city,
        state::varchar               as state,
        postal_code::varchar         as postal_code,
        country::varchar             as country,
        sales_rep_employee_number::int as sales_rep_employee_number,
        credit_limit::float          as credit_limit,
        customer_email::varchar      as customer_email,
        _sync_date::timestamp        as sync_date
    from source
)

select * from renamed