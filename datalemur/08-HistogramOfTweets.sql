WITH TWEETS_PER_USER AS 
(
  SELECT 
    COUNT(tweet_id) as tweet_bucket
  FROM
    tweets
  WHERE
    date_part('year', tweet_date) = 2022
  GROUP BY
    user_id
)

SELECT 
  tweet_bucket,
  COUNT(*) as users_num
FROM
  TWEETS_PER_USER
GROUP BY
  tweet_bucket
;

  
