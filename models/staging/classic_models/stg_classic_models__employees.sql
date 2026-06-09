WITH source AS (
    SELECT * FROM {{ source('classic_models', 'employees') }}
),

renamed AS (
    SELECT
        employee_number,
        last_name,
        first_name,
        extension,
        email,
        office_code,
        reports_to,
        job_title,
        _sync_date AS sync_date
    FROM source
)

SELECT * FROM renamed
