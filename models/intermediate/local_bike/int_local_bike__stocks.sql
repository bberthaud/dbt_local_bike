select store_id, store_name, sum(quantity) as total_quantity
from {{ ref("stg_local_bike__stocks") }}
left join {{ ref("stg_local_bike__stores") }} using (store_id)
group by store_id, store_name
