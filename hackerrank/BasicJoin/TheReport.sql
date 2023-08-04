SELECT
    CASE 
        WHEN Grade >= 8 THEN Name
        ELSE NULL
    END as Name,
    Grade,
    Marks
FROM (
    SELECT 
        *
    FROM
        STUDENTS
    FULL JOIN
        GRADES
    WHERE
        Marks BETWEEN Min_Mark AND Max_Mark
    ORDER BY
        Grade DESC,
        Name ASC
) as t
;