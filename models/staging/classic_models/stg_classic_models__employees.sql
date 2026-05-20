with source as (
    select * from {{ source('classic_models', 'employees') }}
),

renamed as (
    select
        employee_number::int    as employee_number,
        last_name::varchar      as last_name,
        first_name::varchar     as first_name,
        extension::varchar      as extension,
        email::varchar          as email,
        office_code::varchar    as office_code,
        reports_to::int         as reports_to,
        job_title::varchar      as job_title,
        _sync_date::timestamp   as sync_date
    from source
)

select * from renamed