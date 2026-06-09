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
