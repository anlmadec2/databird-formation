select
    order_id,
    sum(total_order_amount) as total_amount
from {{ ref('int_sales_database__order') }}
group by 1
having total_amount < 0