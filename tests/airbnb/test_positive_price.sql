select id
from {{ ref('stg_airbnb__listings') }}
where price <= 0