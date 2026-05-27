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