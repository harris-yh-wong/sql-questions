SELECT 
  transaction_date,
  COUNT(user_id) as number_of_users,
  COUNT(*) as number_of_products
FROM
  user_transactions
GROUP BY
  transaction_date;