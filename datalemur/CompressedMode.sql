WITH ranked AS (
  SELECT 
    item_count,
    DENSE_RANK() OVER(ORDER BY order_occurrences DESC) as r
  FROM
    items_per_order
)

SELECT
  item_count as mode
FROM
  ranked
WHERE
  r = 1
ORDER BY 
  mode;


-- SELECT
--   item_count
-- FROM
--   items_per_order
-- WHERE 
--   order_occurrences = 
--     (SELECT 
--       MAX(order_occurrences)
--     FROM
--       items_per_order)
-- ORDER BY item_count;

