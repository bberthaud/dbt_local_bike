with

    source as (select * from {{ source("local_bike", "order_items") }}),

    renamed as (

        select
            order_id,
            item_id,
            product_id,
            concat(order_id, '-', item_id) as order_item_id,
            quantity as item_quantity,
            list_price,
            discount,
            quantity * list_price * (1 - discount) as total_order_item_price

        from source

    )

select *
from renamed
