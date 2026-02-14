with
    orders_summary as (
        select
            customer_id,
            order_created_at,
            sum(total_order_price) as total_price_spent,
            sum(total_items) as total_items,
            sum(total_distinct_items) as total_distinct_items,
            count(distinct order_id) as total_orders
        from {{ ref("mrt_local_bike__orders") }}
        group by customer_id, order_created_at
    )

select
    o.customer_id,
    c.customer_city,
    c.customer_state,
    o.order_created_at,
    o.total_price_spent,
    o.total_items,
    o.total_distinct_items,
    o.total_orders,
    p.favorite_product_id
from orders_summary as o
left join {{ ref("stg_local_bike__customers") }} as c using (customer_id)
left join {{ ref("int_local_bike__customer_favorite_product") }} p using (customer_id)
