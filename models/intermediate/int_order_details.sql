with order_details as (
    select * from {{ ref('stg_classic_models__order_details') }}
),

products as (
    select * from {{ ref('stg_classic_models__products') }}
),

product_lines as (
    select * from {{ ref('stg_classic_models__product_lines') }}
),

joined as (
    select
        od.order_number,
        od.product_code,
        od.quantity_ordered,
        od.price_each,
        od.order_line_number,
        p.product_name,
        p.product_line,
        p.product_scale,
        p.product_vendor,
        p.product_description,
        p.quantity_in_stock,
        p.buy_price,
        p.msrp,
        pl.text_description as product_line_description
    from order_details od
    left join products p
        on od.product_code = p.product_code
    left join product_lines pl
        on p.product_line = pl.product_line
)

select * from joined