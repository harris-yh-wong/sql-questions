SELECT 
  ROUND(AVG(email_count), 0) as mean,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY email_count) as median,
  MODE() WITHIN GROUP (ORDER BY email_count) as mode
FROM
  inbox_stats;
