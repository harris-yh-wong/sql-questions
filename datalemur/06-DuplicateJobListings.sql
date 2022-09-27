WITH JOBS AS (
  SELECT
    company_id,
    COUNT(*) as n_listing_per_job
  FROM 
    job_listings
  GROUP BY
    company_id, title, description
)

SELECT
  COUNT (DISTINCT company_id) as duplicate_companies
FROM
  JOBS
WHERE
  n_listing_per_job > 1
;