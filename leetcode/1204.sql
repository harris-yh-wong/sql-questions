SELECT t.person_name
FROM (
        SELECT *,
            SUM(weight) OVER(
                ORDER BY turn
            ) AS weight_cumsum
        FROM Queue
    ) t
WHERE t.weight_cumsum <= 1000
ORDER BY t.turn DESC
LIMIT 1;