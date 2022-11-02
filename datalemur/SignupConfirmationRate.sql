WITH 
texts_confirmations AS (
  SELECT
    email_id, 
    1 as flag_confirmation
  FROM
    texts
  WHERE
    signup_action = 'Confirmed'
),

users_confirmation AS (
  SELECT
    emails.user_id,
    MAX(flag_confirmation) as flag_confirmation
  FROM
    emails
  LEFT JOIN
    texts_confirmations
    on emails.email_id = texts_confirmations.email_id
  GROUP BY
    emails.user_id
)

SELECT 
  ROUND(SUM(flag_confirmation)::DECIMAL/count(*), 2) as confirm_rate
FROM 
  users_confirmation
;

