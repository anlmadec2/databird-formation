SELECT
	DATE(order_date) AS order_date,
	count(DISTINCT order_id) AS total_orders,
	count(DISTINCT user_name) AS total_customers,
	count(DISTINCT CASE WHEN order_status= 'shipped' THEN order_id END) AS total_shipped_orders
FROM {{ source('sales_database','order') }}
GROUP BY order_date