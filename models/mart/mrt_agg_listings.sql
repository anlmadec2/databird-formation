{{ config(
 materialized='table',
 tags=['daily']
) }}

select
    neighbourhood_cleansed,
    room_type,
    count(id) as total_listings,
    avg(price) as prix_moyen
from {{ ref('stg_airbnb__listings')}}
group by
    neighbourhood_cleansed,
    room_type