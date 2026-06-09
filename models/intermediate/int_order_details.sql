<<<<<<< HEAD
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
=======
WITH order_details AS (
    SELECT * FROM {{ ref('stg_classic_models__order_details') }}
),

orders AS (
    SELECT * FROM {{ ref('int_orders') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key([
            'o.order_pk', 'od.order_line_number', 'od.product_code'
        ]) }} AS order_detail_pk,
        o.order_pk,
        {{ dbt_utils.generate_surrogate_key(['od.product_code']) }} AS product_pk,
        o.customer_pk,
        od.order_line_number,
        od.product_code,
        od.quantity_ordered,
        od.price_each,
        od.quantity_ordered * od.price_each AS line_total,
        o.order_date,
        od.sync_date
    FROM order_details AS od
    INNER JOIN orders AS o ON od.order_number = o.order_number
)

SELECT * FROM final
>>>>>>> b6a361d16267bbf5459dd6a75e343e46385b0fa1
