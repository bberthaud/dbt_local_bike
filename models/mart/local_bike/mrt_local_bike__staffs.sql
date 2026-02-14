with
    orders_summary as (
        select
            staff_id,
            store_id,
            order_created_at,
            sum(total_order_price) as total_income,
            sum(total_items) as total_items,
            sum(total_distinct_items) as total_distinct_items,
            count(distinct order_id) as total_orders
        from {{ ref("mrt_local_bike__orders") }}
        group by staff_id, store_id, order_created_at
    )

select
    o.staff_id,
    sta.staff_name,
    o.store_id,
    sto.store_name,
    o.order_created_at,
    o.total_income,
    o.total_items,
    o.total_distinct_items,
    o.total_orders
from orders_summary as o
left join {{ ref("stg_local_bike__stores") }} sto using (store_id)
left join {{ ref("stg_local_bike__staffs") }} sta using (staff_id)
