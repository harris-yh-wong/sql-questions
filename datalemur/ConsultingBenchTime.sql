WITH job_days AS (
  SELECT 
    employee_id,
    end_date - start_date + 1 as days
  FROM 
    staffing
  INNER JOIN
    consulting_engagements as jobs
    ON staffing.job_id = jobs.job_id
  WHERE 
    staffing.is_consultant = 'true'
)

SELECT
  employee_id,
  365 - SUM(days) as bench_days
FROM
  job_days
GROUP BY
  employee_id
;
