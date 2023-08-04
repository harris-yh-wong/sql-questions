WITH tLM AS (
SELECT company_code, COUNT(DISTINCT lead_manager_code) AS LM 
FROM LEAD_MANAGER GROUP BY company_code
)

, tSM AS (
SELECT company_code, COUNT(DISTINCT senior_manager_code) AS SM 
FROM SENIOR_MANAGER GROUP BY company_code
) 

, tM AS (
SELECT company_code, COUNT(DISTINCT manager_code) AS M
FROM MANAGER GROUP BY company_code
) 


, tE AS (
SELECT company_code, COUNT(DISTINCT employee_code) AS E 
FROM EMPLOYEE GROUP BY company_code
)


SELECT 
    tC.company_code
    , tC.founder
    , tLM.LM
    , tSM.SM
    , tM.M
    , tE.E
FROM   
    COMPANY AS tC
LEFT JOIN tLM ON tC.company_code = tLM.company_code
LEFT JOIN tSM on tC.company_code = tSM.company_code
LEFT JOIN tM on tC.company_code = tM.company_code
LEFT JOIN tE on tC.company_code = tE.company_code
   
ORDER BY
    CAST(SUBSTRING(tC.company_code, 2, 10) as INT) 


    -- substring in sql is 1-indexed (like R)
; 




select e.company_code, c.founder,
count(distinct(e.lead_manager_code)),
count(distinct(e.senior_manager_code)),
count(distinct(e.manager_code)),
count(distinct(e.employee_code))

from company c
join employee e on e.company_code = c.company_code

group by e.company_code,c.founder;