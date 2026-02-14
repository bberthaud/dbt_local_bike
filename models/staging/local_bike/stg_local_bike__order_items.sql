with 

source as (

    select * from {{ source('local_bike', 'order_items') }}

),

renamed as (

    select
        order_id,
        item_id,
        product_id,
        concat(order_id, '-', item_id, '-', product_id) as order_item_product_id,
        quantity,
        list_price,
        discount

    from source

)

select * from renamed