with
    orders_summary as (
        select
            store_id,
            order_status,
            order_created_at,
            sum(total_income) as total_income,
            sum(total_items) as total_items,
            sum(total_distinct_items) as total_distinct_items,
            sum(total_orders) as total_orders
        from {{ ref("mrt_local_bike__staffs") }}
        group by store_id, order_created_at, order_status
    )

select
    o.store_id,
    s.store_name,
    s.store_city,
    s.store_state,
    o.order_status,
    o.order_created_at,
    o.total_income,
    o.total_items,
    o.total_distinct_items,
    o.total_orders
from orders_summary as o
left join {{ ref("stg_local_bike__stores") }} s using (store_id)
order by o.store_id