select customer_id, product_id as favorite_product_id
from {{ ref("int_local_bike__order_items") }}
group by customer_id, product_id
qualify
    row_number() over (partition by customer_id order by sum(item_quantity) desc) = 1
