WITH DATED AS (
  SELECT 
    measurement_value, 
    measurement_time,
    DATE(measurement_time) as measurement_day
  FROM 
    measurements
  ORDER BY 
    measurement_time
)

SELECT
  t.measurement_day,
  SUM(CASE WHEN t.flag_odd = 1 THEN t.measurement_value ELSE 0 END) as odd_sum, 
  SUM(CASE WHEN t.flag_odd = 0 THEN t.measurement_value ELSE 0 END) as even_sum 
FROM
(
  SELECT 
    measurement_day,
    measurement_value,
    mod(ROW_NUMBER() OVER(PARTITION BY measurement_day), 2) as flag_odd
  FROM
    DATED
) as t
GROUP BY
  measurement_day;


