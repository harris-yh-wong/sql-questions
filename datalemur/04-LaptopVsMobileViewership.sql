SELECT
  COUNT(*) - SUM(t.mobile) as laptop_views,
  SUM(t.mobile) as mobile_views
FROM
  (
    SELECT
      CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END AS mobile
    FROM 
      VIEWERSHIP
  )
  AS t;


--OR
SELECT
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
FROM
  viewership;
