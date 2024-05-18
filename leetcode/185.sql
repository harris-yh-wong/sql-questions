# using window functions in CTE then filter by rank
# rank() vs dense_rank()
WITH ranked_salary AS (
    SELECT D.name AS Department,
        E.name AS Employee,
        E.salary AS Salary,
        DENSE_RANK() OVER(
            PARTITION BY D.id
            ORDER BY E.Salary DESC
        ) AS salary_rank
    FROM Employee E
        JOIN Department D ON E.departmentId = D.id
)
SELECT Department,
    Employee,
    Salary
FROM ranked_salary
WHERE salary_rank <= 3;