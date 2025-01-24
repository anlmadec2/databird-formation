WITH monthly_users_recap AS (

SELECT DATE_TRUNC(order_created_at,month) AS order_month,
COUNT(DISTINCT user_id) AS total_monthly_users,
  COUNT(order_id) AS total_monthly_orders
FROM {{ ref('stg_sales_database__order')}}
GROUP BY order_month
ORDER BY total_monthly_users DESC

), total_monthly_user_from_jawa_timur AS (
SELECT DATE_TRUNC(order_created_at,month) AS order_month,
COUNT(DISTINCT user.user_id) AS total_monthly_users_from_jawa_timur
FROM {{ ref('stg_sales_database__order')}} AS orders
LEFT JOIN {{ ref('stg_sales_database__user')}} AS user ON user.user_id = orders.user_id
WHERE user.user_state LIKE '%JAWA%TIMUR%'
GROUP BY order_month
)
SELECT u.order_month,
COALESCE(u.total_monthly_users,0) AS total_users_monthly,
COALESCE(jt.total_monthly_users_from_jawa_timur,0) AS total_monthly_user_from_jawa_timer,
COALESCE(u.total_monthly_orders,0) AS total_monthly_orders
FROM monthly_users_recap AS u
LEFT JOIN total_monthly_user_from_jawa_timur AS jt ON jt.order_month = u.order_month
ORDER BY order_month
