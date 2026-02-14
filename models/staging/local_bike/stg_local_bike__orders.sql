with 

source as (

    select * from {{ source('local_bike', 'orders') }}

),

renamed as (

    select
        order_id,
        customer_id,
        cast(order_status as string) as order_status,
        date(order_date) as order_created_at,
        date(required_date) as order_required_at,
        date(nullif(shipped_date, 'NULL')) as order_shipped_at,
        store_id,
        staff_id

    from source

)

select * from renamed