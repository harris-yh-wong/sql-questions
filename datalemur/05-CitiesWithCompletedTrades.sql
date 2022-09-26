SELECT 
  USERS.city,
  COUNT(*) AS total_orders
FROM
  TRADES
INNER JOIN
  USERS
ON 
  TRADES.user_id = USERS.user_id
WHERE
  TRADES.status = 'Completed'
GROUP BY
  USERS.city
ORDER BY
  total_orders DESC
LIMIT 
  3;
