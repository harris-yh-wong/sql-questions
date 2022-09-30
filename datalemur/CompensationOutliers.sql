SELECT * FROM (
  SELECT
    employee_id,
    salary,
    ( CASE 
      WHEN salary >2*AVG(salary) OVER(PARTITION BY title)  THEN 'Overpaid' 
      WHEN salary <0.5*AVG(salary) OVER(PARTITION BY title)  THEN 'Underpaid' 
      ELSE 'non-outlier' 
      END
    ) as status
  FROM
    employee_pay
) t
WHERE 
  status in ('Overpaid', 'Underpaid');
