WITH all_plays AS(
  (
  SELECT 
    user_id,
    song_id,
    COUNT(song_id) AS song_plays
  FROM
    songs_weekly
  WHERE
    listen_time::date <= '2022-08-04'
  GROUP BY
    user_id,
    song_id
  )
  
  UNION ALL
  
  (
  SELECT 
    user_id, 
    song_id, 
    song_plays 
  FROM
    songs_history
  )
)
,

SELECT 
	user_id,
	song_id,
	SUM(song_plays) as song_counts
FROM 
	all_plays
GROUP BY
	user_id,
	song_id
ORDER BY
	song_counts DESC
;


