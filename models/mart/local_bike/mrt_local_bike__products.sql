select
    oi.product_id,
    p.product_name,
    c.category_name,
    b.brand_id,
    oi.order_status,
    oi.order_created_at,
    oi.total_quantity,
    oi.total_product_income,
    oi.total_orders
from {{ref("int_local_bike__products")}} as oi
left join {{ref("stg_local_bike__products")}} as p using(product_id)
left join {{ref("stg_local_bike__categories")}} as c using(category_id)
left join {{ref("stg_local_bike__brands")}} as b using(brand_id)