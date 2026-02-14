with
    order_item_grouped_by_product as (

        select
            product_id,
            order_created_at,
            order_required_at,
            order_shipped_at,
            sum(item_quantity) as total_quantity,
            sum(total_order_item_price) as total_product_income,
            count(order_id) as total_orders
        from {{ ref("int_local_bike__order_items") }}
        group by
            product_id,
            order_created_at,
            order_required_at,
            order_shipped_at

    )

select
    oi.product_id,
    oi.order_created_at,
    oi.order_required_at,
    oi.order_shipped_at,
    coalesce(oi.total_quantity, 0) as total_quantity,
    coalesce(oi.total_product_income, 0) as total_product_income,
    coalesce(oi.total_orders, 0) as total_orders
from order_item_grouped_by_product as oi
