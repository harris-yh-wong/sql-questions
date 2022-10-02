WITH TWEETS_PER_USER_PER_DAY AS (
  SELECT 
    t.user_id,
    t.tweet_date,
    COUNT(t.tweet_id) as tweet_count
  FROM
    ( SELECT 
        *
      FROM
        tweets
      ORDER BY
        user_id, tweet_date
    ) as t
  GROUP BY
    t.user_id, t.tweet_date
)

SELECT
  user_id,
  tweet_date, 
  ROUND(
    AVG(tweet_count)
    OVER(PARTITION BY user_id ORDER BY tweet_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),
    2
  ) as rolling_avg_3d
FROM
  TWEETS_PER_USER_PER_DAY
;

-- This task is not about *daily rollmean* but rollmean across the three most recent days with tweets

