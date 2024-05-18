-- Select the node with the most edges from a bi-directional edge list. 
-- because each edge connects two nodes,
-- essentially we count the total occurences of each id in the two columns 
-- ------------- 
WITH occurrences AS (
    (
        SELECT requester_id AS id
        FROM RequestAccepted
    )
    UNION ALL
    (
        SELECT accepter_id AS id
        FROM RequestAccepted
    )
)
SELECT id,
    COUNT(*) AS num
FROM occurrences
GROUP BY id
ORDER BY num DESC
LIMIT 1;