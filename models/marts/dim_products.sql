with products as (
    select * from {{ ref('int_order_details') }}
),

final as (
    select distinct
        {{ dbt_utils.generate_surrogate_key(['product_code']) }}
            as product_pk,
        product_code,
        product_name,
        product_line,
        product_scale,
        product_vendor,
        product_description
    from products
)

select * from final