       with source as (
       
           select * from {{ source('classic_models', 'employees') }}
       
       ),
       
       renamed as (
       
           select
               employee_number,
               last_name,
               first_name,
               extension,
               email,
               office_code,
               reports_to,
               job_title,
               _sync_date
       
           from source
       
       )
       
       select * from renamed