<<<<<<< HEAD
with date_spine as (
    select * from {{ ref('stg_classic_models__date_spine') }}
),

final as (
    select
        date_day                                    as date_day,
        year(date_day)                              as date_year,
        quarter(date_day)                           as date_quarter,
        month(date_day)                             as date_month,
        weekofyear(date_day)                        as date_week,
        dayofmonth(date_day)                        as date_day_of_month
    from date_spine
)

select * from final
=======
WITH date_spine AS (
    SELECT * FROM {{ ref('date_spine') }}
),

final AS (
    SELECT
        date_day,
        YEAR(date_day) AS date_year,
        QUARTER(date_day) AS date_quarter,
        MONTH(date_day) AS date_month,
        WEEKOFYEAR(date_day) AS date_week,
        DAYOFMONTH(date_day) AS date_day_of_month
    FROM date_spine
)

SELECT * FROM final
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
