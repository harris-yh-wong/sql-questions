WITH TRANSACTIONS_NUMBERED AS
(
  SELECT 
    user_id,
    spend,
    transaction_date,
    row_number() over(partition by user_id order by transaction_date) as rn
  FROM
    TRANSACTIONS
)

SELECT
  user_id,
  spend,
  transaction_date
FROM
  TRANSACTIONS_NUMBERED
WHERE
  rn = 3
;

-- "use of a window function does not cause rows to become grouped into a single output row"
-- Think of
--   tbl %>% group_by(g) %>% summarise(m = mean(x)) vs  
--   tbl %>% group_by(g) %>% mutate(m = mean(x))
