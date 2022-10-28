WITH 
-- 'song appearances'  in the daily chart (top 10 position only)
-- row = song
song_appearances AS (
  SELECT
    song_id,
    COUNT(*) as appearances
  FROM
    global_song_rank
  WHERE
    rank <= 10
  GROUP BY
    song_id
),

-- number of 'song apperances' per artists
-- row = artist
artist_appearances AS (
  SELECT  
    artist_id,
    SUM(song_appearances.appearances) as appearances
  FROM
    song_appearances
  LEFT JOIN
    songs
    ON song_appearances.song_id = songs.song_id
  GROUP BY
    artist_id
),

-- rank (according to song appearances) of artists
-- row = artist
artist_ranks AS (
  SELECT
    artists.artist_name,
    DENSE_RANK() OVER(
      ORDER BY appearances DESC
    ) as artist_rank
  FROM
    artist_appearances
  LEFT JOIN
    artists
    ON artist_appearances.artist_id = artists.artist_id
)

SELECT
  *
FROM 
  artist_ranks
WHERE
  artist_rank <= 5
ORDER BY
  artist_rank, artist_name
;