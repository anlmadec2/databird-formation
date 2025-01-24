SELECT
    oi.order_id,
    order_item_id,
    {{ calculate_total_order_item('unit_price', 'item_quantity') }} as total_order_amount,
    item_quantity,
    product_id,
    o.user_id,
    o.order_status,
    o.order_created_at,
    o.order_approved_at
FROM
    {{ ref('stg_sales_database__order_item') }} as oi
    INNER JOIN {{ ref('stg_sales_database__order') }} as o ON oi.order_id = o.order_id