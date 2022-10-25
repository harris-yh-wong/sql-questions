WITH spendings AS (
  SELECT 
    category,
    product,
    sum(spend) as total_spend
  FROM
    product_spend
  WHERE
    extract(year from transaction_date) = 2022
  GROUP BY
    category, product
)

SELECT
  category,
  product,
  total_spend
FROM (
  SELECT
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_spend DESC) AS r,
    t.*
  FROM
    spendings t) x
WHERE
  x.r <= 2;


