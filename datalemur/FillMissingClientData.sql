WITH grouped AS (
  SELECT
    product_id,
    category,
    name,
    COUNT(category)
      OVER (ORDER BY product_id) 
      AS grp
  FROM products
  ORDER BY product_id
)


SELECT
  product_id,
  first_value(category) 
    OVER (PARTITION BY grp ORDER BY product_id)
    AS category,
  name
FROM
  grouped;
