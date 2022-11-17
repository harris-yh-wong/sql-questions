-- trick: do select twice by flips the columns

-- INTERESECT select distinct results only
-- Thus, the CTE keeps "bi-directional" pairs only
-- But each of them appear exactly **twice**,
-- one from the first SELECT query, and another from the second SELECT query

-- this is good if all we want is the number of rows
 
WITH duplicated_pairs as (
  SELECT payer_id, recipient_id FROM payments
  INTERSECT
  SELECT recipient_id, payer_id FROM payments
)

SELECT
  COUNT(*)/2 as unique_relationships
FROM 
  duplicated_pairs;



-- ALTERNATIVELY,
-- if we want the exact list of pairs

-- WITH sorted_pairs AS (
--   SELECT DISTINCT 
--     CASE WHEN dir1.payer_id > dir1.recipient_id THEN dir1.payer_id ELSE dir1.recipient_id END 
--       as larger_id,
--     CASE WHEN dir1.payer_id > dir1.recipient_id THEN dir1.recipient_id ELSE dir1.payer_id END 
--       as smaller_id
--   FROM
--     payments as dir1
--   LEFT JOIN
--     payments as dir2
--     ON dir1.recipient_id = dir2.payer_id
--   WHERE dir1.payer_id = dir2.recipient_id
-- )
--
-- SELECT 
--   COUNT(*) as unique_relationships
-- FROM 
--   sorted_pairs;