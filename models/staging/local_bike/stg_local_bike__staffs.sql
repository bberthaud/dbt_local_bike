with

    source as (select * from {{ source("local_bike", "staffs") }}),

    renamed as (

        select
            staff_id,
            first_name,
            last_name,
            email,
            phone,
            active,
            store_id,
            cast(nullif(manager_id, 'NULL') as int) as manager_id

        from source

    )

select *
from renamed
