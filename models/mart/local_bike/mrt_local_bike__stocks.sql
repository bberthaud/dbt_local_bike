select store_id, store_name, category_name, sum(quantity) as product_quantity
from {{ ref("stg_local_bike__stocks") }} s
left join {{ ref("stg_local_bike__stores") }} sto using (store_id)
left join {{ ref("stg_local_bike__products") }} p using (product_id)
left join {{ ref("stg_local_bike__categories") }} c using (category_id)
group by store_id, store_name, category_name
