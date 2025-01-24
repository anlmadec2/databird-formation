select 1 as column,
seller_id,
 seller_zip_code,
 seller_city,
 seller_state
from {{ source('sales_database', 'seller') }}