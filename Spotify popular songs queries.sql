-- the most danceable songs --

SELECT 
  track_name,
  artist_s__name,
  released_year, 
  danceability__
FROM 
  `bombata-415714.Spotify.popular_songs`
WHERE 
  danceability__ >= 90
ORDER BY 
  danceability__ DESC


-- The most energetic songs --

SELECT 
  track_name,
  artist_s__name,
  released_year, 
  energy__
FROM 
  `bombata-415714.Spotify.popular_songs`
WHERE 
  energy__ >= 90
ORDER BY 
  energy__ DESC


  -- Most popular artist --

SELECT 
  name,
  COUNT(*) AS occurrence_count
FROM (
  SELECT 
    SPLIT
    (artist_s__name, ",") as split_names
  FROM 
    `bombata-415714.Spotify.popular_songs`
), UNNEST
    (split_names) AS name
GROUP BY 
  name
ORDER BY 
  occurrence_count DESC 


  -- Ordering by date --

SELECT 
  track_name,
  artist_s__name,
  CONCAT(released_month,"/", released_day, "/", released_year) AS date
FROM
  `bombata-415714.Spotify.popular_songs`
ORDER BY 
  released_year DESC


  -- How many songs per year --

SELECT
  released_year,
  COUNT(released_year) AS songs_per_year
FROM
  `bombata-415714.Spotify.popular_songs`
GROUP BY 
  released_year
ORDER BY
  songs_per_year DESC


  -- Average song charecteristics, rounded --

SELECT 
  ROUND(AVG(danceability__),2) AS avg_danceability,
  ROUND(AVG(valence__),2) AS avg_valence,
  ROUND(AVG(energy__),2) AS avg_energy,
  ROUND(AVG(acousticness__),2) AS avg_acousticness,
  ROUND(AVG(instrumentalness__),2) AS avg_instrumentalness,
  ROUND(AVG(liveness__),2) AS avg_liveness,
  ROUND(AVG(speechiness__),2) AS avg_speechiness
FROM
  `bombata-415714.Spotify.popular_songs`
