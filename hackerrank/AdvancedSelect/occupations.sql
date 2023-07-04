-- THE PADS
SELECT CONCAT(
    NAME, "(", 
    SUBSTRING(OCCUPATION, 1,1), 
    ")") AS QUERY
FROM OCCUPATIONS
ORDER BY NAME, OCCUPATION;


SELECT CONCAT(
    "There are a total of ",
    cast(COUNT(*) as char),
    " ",
    LOWER(OCCUPATION), "s."
) AS QUERY
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(*) ASC, OCCUPATION ASC;

-- Occupations (Pivoting)

SELECT 
    MAX(CASE WHEN t.Occupation = "Doctor" THEN t.Name END) as Doctor
    , MAX(CASE WHEN t.Occupation = "Professor" THEN t.Name END) as Professor
    , MAX(CASE WHEN t.Occupation = "Singer" THEN t.Name END) as Singer
    , MAX(CASE WHEN t.Occupation = "Actor" THEN t.Name END) as Actor
FROM
( 
    SELECT
        *
        , ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) as rownum
    FROM
        OCCUPATIONS
) AS t

GROUP BY
    t.rownum
;


