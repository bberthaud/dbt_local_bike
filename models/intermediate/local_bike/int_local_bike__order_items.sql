select
    oi.order_id,
    oi.order_item_id,
    oi.total_order_item_price,
    oi.item_quantity,
    oi.product_id,
    o.customer_id,
    o.store_id,
    o.staff_id,
    o.order_status,
    o.order_created_at,
    o.order_required_at,
    o.order_shipped_at
from {{ ref("stg_local_bike__order_items") }} as oi
inner join {{ ref("stg_local_bike__orders") }} as o using (order_id)
