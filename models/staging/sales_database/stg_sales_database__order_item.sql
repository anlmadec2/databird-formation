SELECT
    CONCAT(order_id, '_', product_id) as order_item_id,
    order_id,
    product_id,
    seller_id,
    DATETIME(pickup_limit_date, 'Europe/Paris') AS picked_up_limited_at,
    price as unit_price,
    shipping_cost,
    quantity as item_quantity
FROM {{ source('sales_database','order_item') }}