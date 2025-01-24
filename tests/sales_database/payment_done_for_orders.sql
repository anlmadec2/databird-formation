select o.order_id
from {{ ref('stg_sales_database__order') }} o 
left join {{ ref('stg_sales_database__payment') }}  p on o.order_id =p.order_id 
where payment_value = 0
and order_status in ('shipped','approved','invoiced','delivered','processing')
and 1 = 0