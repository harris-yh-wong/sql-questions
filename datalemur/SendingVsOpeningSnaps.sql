WITH TIME_BY_AGE_BUCKET AS (
SELECT 
  age_breakdown.age_bucket,
  activities.activity_type,
  SUM(time_spent) as time_spent
FROM
  activities
LEFT JOIN
  age_breakdown
  ON activities.user_id = age_breakdown.user_id
WHERE
  activity_type IN ('send', 'open')
GROUP BY
  age_breakdown.age_bucket, activities.activity_type
)

SELECT
  t.age_bucket,
  ROUND((t.send_time / (t.send_time+t.open_time) * 100.0), 2) as send_perc, 
  ROUND((t.open_time / (t.send_time+t.open_time) * 100.0), 2) as open_perc
FROM (
  SELECT
    age_bucket, 
    SUM((CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END)) as send_time,
    SUM((CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END)) as open_time
  FROM
    TIME_BY_AGE_BUCKET
  GROUP BY
    age_bucket
) as t
;

-- peculiar: operations normally done with pivot in tidyverse would be done with ...?
-- #! Needs optimisation

