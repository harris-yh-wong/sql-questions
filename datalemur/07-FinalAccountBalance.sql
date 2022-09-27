SELECT
  account_id,
  SUM(
    (CASE WHEN transaction_type = 'Deposit' 
    THEN amount 
    ELSE -1*amount 
    END )
  ) AS final_balance
FROM 
  TRANSACTIONS
GROUP BY
  account_id
;

