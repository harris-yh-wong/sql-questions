WITH supercustomers as (
  SELECT 
    contracts.customer_id
  FROM
    customer_contracts as contracts
  LEFT JOIN
    products
    ON contracts.product_id = products.product_id
  GROUP BY
    contracts.customer_id
  HAVING
    COUNT(DISTINCT products.product_category) = 3
)

SELECT
  customer_id
FROM
  supercustomers
ORDER BY
  customer_id;
