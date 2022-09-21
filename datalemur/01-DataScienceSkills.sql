SELECT t.candidate_id
FROM
  (
  SELECT
    *
  FROM
    CANDIDATES
  WHERE
    skill IN ('Python', 'Tableau', 'PostgreSQL')
  ) as t
GROUP BY
  t.candidate_id
HAVING
  COUNT(t.skill) = 3
ORDER BY 
  t.candidate_id;
