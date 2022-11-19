WITH repeat_purchases AS (

SELECT 
  user_id as users
FROM
  purchases
GROUP BY
  user_id,
  product_id
HAVING
  COUNT(DISTINCT purchase_date::DATE) >= 2

)


SELECT
  COUNT(DISTINCT users) as repeated_purchasers
FROM
  repeat_purchases;

