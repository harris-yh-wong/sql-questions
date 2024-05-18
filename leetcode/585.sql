SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE # unique lat-lon pairs among all policyholder 
    pid IN (
        SELECT pid
        FROM Insurance
        GROUP BY lat,
            lon
        HAVING COUNT(DISTINCT pid) = 1
    )
    AND # values of tiv_2015 where there are more than one policyholder
    tiv_2015 IN (
        SELECT tiv_2015
        FROM Insurance
        GROUP BY tiv_2015
        HAVING COUNT(DISTINCT pid) > 1
    );