SELECT 
    t.hacker_id
    , t.hacker_name
FROM (
    SELECT
        HACKERS.hacker_id as hacker_id
        , MAX(HACKERS.name) as hacker_name
        , COUNT(*) AS n_challenges_full_score
    FROM  
        SUBMISSIONS
    LEFT JOIN
        CHALLENGES
        ON SUBMISSIONS.challenge_id = CHALLENGES.challenge_id
    LEFT JOIN
        DIFFICULTY
        ON CHALLENGES.difficulty_level = DIFFICULTY.difficulty_level
    LEFT JOIN
        HACKERS
        ON SUBMISSIONS.hacker_id = HACKERS.hacker_id
    WHERE
        SUBMISSIONS.score = DIFFICULTY.score
    GROUP BY 
        HACKERS.hacker_id 
) as t

WHERE
    t.n_challenges_full_score > 1
ORDER BY 
    t.n_challenges_full_score DESC
    , t.hacker_id
;