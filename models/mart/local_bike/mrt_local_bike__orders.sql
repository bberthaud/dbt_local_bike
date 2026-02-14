with
    order_item_grouped_by_order as (

        select
            order_id,
            customer_id,
            store_id,
            staff_id,
            order_status,
            order_created_at,
            order_required_at,
            order_shipped_at,
            sum(total_order_item_price) as total_order_price,
            sum(item_quantity) as total_items,
            count(distinct product_id) as total_distinct_items
        from {{ ref("int_local_bike__order_items") }}
        group by
            order_id,
            customer_id,
            store_id,
            staff_id,
            order_status,
            order_created_at,
            order_required_at,
            order_shipped_at

    )

select
    oi.order_id,
    oi.customer_id,
    oi.store_id,
    oi.staff_id,
    oi.order_status,
    oi.order_created_at,
    oi.order_required_at,
    oi.order_shipped_at,
    coalesce(oi.total_order_price, 0) as total_order_price,
    coalesce(oi.total_items, 0) as total_items,
    coalesce(oi.total_distinct_items, 0) as total_distinct_items
from order_item_grouped_by_order as oi
