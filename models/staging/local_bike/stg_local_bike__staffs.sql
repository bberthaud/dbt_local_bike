with

    source as (select * from {{ source("local_bike", "staffs") }}),

    renamed as (

        select
            staff_id,
            first_name as staff_first_name,
            last_name as staff_last_name,
            concat(first_name, ' ', last_name) as staff_name,
            email as staff_email,
            phone as staff_phone,
            active,
            store_id,
            cast(nullif(manager_id, 'NULL') as int) as manager_id

        from source

    )

select *
from renamed
