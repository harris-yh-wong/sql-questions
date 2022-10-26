SELECT
  COUNT(*) as users
FROM (
  SELECT
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) AS rownum,
    t.*
  FROM
    user_transactions t) x
WHERE
  x.rownum <= 1 
  AND spend > 50;
