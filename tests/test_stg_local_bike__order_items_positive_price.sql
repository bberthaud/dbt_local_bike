select total_order_item_price
from {{ ref("stg_local_bike__order_items") }}
where list_price < 0