-- Let's check how the data looks like
SELECT * FROM survey_data_cleaned LIMIT 10;

-- We will convert text to numerical values to make the data more SQL-friendly

-- Converting the Yes/No responses to 1/0
-- Create a new table or SELECT query with the transformed values
SELECT
  age,
  hours_per_day,
  CASE WHEN while_working = 'Yes' THEN 1 ELSE 0 END AS while_working,
  CASE WHEN instrumentalist = 'Yes' THEN 1 ELSE 0 END AS instrumentalist,
  CASE WHEN composer = 'Yes' THEN 1 ELSE 0 END AS composer,
  fav_genre,  -- Keeping fav_genre as text
  CASE WHEN exploratory = 'Yes' THEN 1 ELSE 0 END AS exploratory,
  CASE WHEN foreign_languages = 'Yes' THEN 1 ELSE 0 END AS foreign_languages,
  
  -- Converting the Frequency responses to numeric values
  CASE
    WHEN Frequency_Classical = 'Never' THEN 0
    WHEN Frequency_Classical = 'Rarely' THEN 1
    WHEN Frequency_Classical = 'Sometimes' THEN 2
    WHEN Frequency_Classical = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_Classical,
  
  CASE
    WHEN Frequency_Country = 'Never' THEN 0
    WHEN Frequency_Country = 'Rarely' THEN 1
    WHEN Frequency_Country = 'Sometimes' THEN 2
    WHEN Frequency_Country = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_Country,
  
  CASE
    WHEN Frequency_EDM = 'Never' THEN 0
    WHEN Frequency_EDM = 'Rarely' THEN 1
    WHEN Frequency_EDM = 'Sometimes' THEN 2
    WHEN Frequency_EDM = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_EDM,
  
  CASE
    WHEN Frequency_Folk = 'Never' THEN 0
    WHEN Frequency_Folk = 'Rarely' THEN 1
    WHEN Frequency_Folk = 'Sometimes' THEN 2
    WHEN Frequency_Folk = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_Folk,
  
  CASE
    WHEN Frequency_Gospel = 'Never' THEN 0
    WHEN Frequency_Gospel = 'Rarely' THEN 1
    WHEN Frequency_Gospel = 'Sometimes' THEN 2
    WHEN Frequency_Gospel = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_Gospel,
  
  CASE
    WHEN Frequency_Hip_hop = 'Never' THEN 0
    WHEN Frequency_Hip_hop = 'Rarely' THEN 1
    WHEN Frequency_Hip_hop = 'Sometimes' THEN 2
    WHEN Frequency_Hip_hop = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_Hip_hop,
  
  CASE
    WHEN Frequency_Jazz = 'Never' THEN 0
    WHEN Frequency_Jazz = 'Rarely' THEN 1
    WHEN Frequency_Jazz = 'Sometimes' THEN 2
    WHEN Frequency_Jazz = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_Jazz,
  
  CASE
    WHEN Frequency_K_pop = 'Never' THEN 0
    WHEN Frequency_K_pop = 'Rarely' THEN 1
    WHEN Frequency_K_pop = 'Sometimes' THEN 2
    WHEN Frequency_K_pop = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_K_pop,
  
  CASE
    WHEN Frequency_Latin = 'Never' THEN 0
    WHEN Frequency_Latin = 'Rarely' THEN 1
    WHEN Frequency_Latin = 'Sometimes' THEN 2
    WHEN Frequency_Latin = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_Latin,
  
  CASE
    WHEN Frequency_Lofi = 'Never' THEN 0
    WHEN Frequency_Lofi = 'Rarely' THEN 1
    WHEN Frequency_Lofi = 'Sometimes' THEN 2
    WHEN Frequency_Lofi = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_Lofi,
  
  CASE
    WHEN Frequency_Metal = 'Never' THEN 0
    WHEN Frequency_Metal = 'Rarely' THEN 1
    WHEN Frequency_Metal = 'Sometimes' THEN 2
    WHEN Frequency_Metal = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_Metal,
  
  CASE
    WHEN Frequency_Pop = 'Never' THEN 0
    WHEN Frequency_Pop = 'Rarely' THEN 1
    WHEN Frequency_Pop = 'Sometimes' THEN 2
    WHEN Frequency_Pop = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_Pop,
  
  CASE
    WHEN Frequency_RnB = 'Never' THEN 0
    WHEN Frequency_RnB = 'Rarely' THEN 1
    WHEN Frequency_RnB = 'Sometimes' THEN 2
    WHEN Frequency_RnB = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_RnB,
  
  CASE
    WHEN Frequency_Rap = 'Never' THEN 0
    WHEN Frequency_Rap = 'Rarely' THEN 1
    WHEN Frequency_Rap = 'Sometimes' THEN 2
    WHEN Frequency_Rap = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_Rap,
  
  CASE
    WHEN Frequency_Rock = 'Never' THEN 0
    WHEN Frequency_Rock = 'Rarely' THEN 1
    WHEN Frequency_Rock = 'Sometimes' THEN 2
    WHEN Frequency_Rock = 'Very frequently' THEN 3
    ELSE NULL
  END AS Frequency_Rock,
  
  CASE
    WHEN Frequency_Video_game_music = 'Never' THEN 0
    WHEN Frequency_Video_game_music = 'Rarely' THEN 1
    WHEN Frequency_Video_game_music = 'Sometimes' THEN 3
    WHEN Frequency_Video_game_music = 'Very frequently' THEN 4
    ELSE NULL
  END AS Frequency_Video_game_music,
  
  -- Converting Music_effects responses to numerical values
  CASE
    WHEN Music_effects = 'Worsen' THEN 0
    WHEN Music_effects = 'No effect' THEN 1
    WHEN Music_effects = 'Improve' THEN 2
    ELSE NULL
  END AS Music_effects_numeric,

  -- Leave the Anxiety, Depression, Insomnia, OCD, Music_effects columns as they are (without conversion)
  Anxiety,
  Depression,
  Insomnia,
  OCD
  
FROM survey_data_cleaned;









----Basic Statistics






--Combined query to get all the requested statistics in a single response
SELECT
    -- Total number of respondents
    COUNT(*) AS total_respondents,
    
    -- Most frequent age (age distribution)
    (SELECT age FROM survey_data_cleaned GROUP BY age ORDER BY COUNT(*) DESC LIMIT 1) AS most_frequent_age,

    -- Basic descriptive stats for hours_per_day
    MIN(hours_per_day) AS min_hours,
    MAX(hours_per_day) AS max_hours,
    AVG(hours_per_day) AS avg_hours,

    -- Basic descriptive stats for anxiety scores
    MIN(anxiety) AS min_anxiety,
    MAX(anxiety) AS max_anxiety,
    AVG(anxiety) AS avg_anxiety,

    -- Basic descriptive stats for depression scores
    MIN(depression) AS min_depression,
    MAX(depression) AS max_depression,
    AVG(depression) AS avg_depression,

    -- Basic descriptive stats for insomnia scores
    MIN(insomnia) AS min_insomnia,
    MAX(insomnia) AS max_insomnia,
    AVG(insomnia) AS avg_insomnia,

    -- Basic descriptive stats for OCD scores
    MIN(ocd) AS min_ocd,
    MAX(ocd) AS max_ocd,
    AVG(ocd) AS avg_ocd,

    -- Basic descriptive stats for Music_effects (converted to numeric values)
    MIN(CASE
        WHEN Music_effects = 'Worsen' THEN 0
        WHEN Music_effects = 'No effect' THEN 1
        WHEN Music_effects = 'Improve' THEN 2
        ELSE NULL
    END) AS min_music_effects,
    MAX(CASE
        WHEN Music_effects = 'Worsen' THEN 0
        WHEN Music_effects = 'No effect' THEN 1
        WHEN Music_effects = 'Improve' THEN 2
        ELSE NULL
    END) AS max_music_effects,
    AVG(CASE
        WHEN Music_effects = 'Worsen' THEN 0
        WHEN Music_effects = 'No effect' THEN 1
        WHEN Music_effects = 'Improve' THEN 2
        ELSE NULL
    END) AS avg_music_effects

FROM survey_data_cleaned;








---Category Distributions




-- Distribution of age with percentages
SELECT Age,
       COUNT(*) AS count_Age,
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY Age
ORDER BY count_Age DESC;


-- Distribution of primary streaming services with percentages
SELECT primary_streaming_service,
       COUNT(*) AS count_service,
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data
GROUP BY primary_streaming_service
ORDER BY count_service DESC;

-- Distribution of hours per day with percentages
SELECT hours_per_day,
       COUNT(*) AS count_hours,
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY hours_per_day
ORDER BY count_hours DESC;

-- Distribution of instrumentalist responses with percentages
SELECT instrumentalist,
       COUNT(*) AS count_instrumentalist,
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY instrumentalist
ORDER BY count_instrumentalist DESC;

-- Distribution of composer responses with percentages
SELECT composer,
       COUNT(*) AS count_composer,
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY composer
ORDER BY count_composer DESC;

-- Distribution of while_working responses with percentages
SELECT while_working,
       COUNT(*) AS count_while_working,
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY while_working
ORDER BY count_while_working DESC;

-- Distribution of exploratory responses with percentages
SELECT exploratory,
       COUNT(*) AS count_exploratory,
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY exploratory
ORDER BY count_exploratory DESC;

-- Count how many respondents chose each frequency category for each genre with numeric conversion and percentages
SELECT 'Rock' AS genre,
       CASE
           WHEN "frequency_rock" = 'Never' THEN 0
           WHEN "frequency_rock" = 'Rarely' THEN 1
           WHEN "frequency_rock" = 'Sometimes' THEN 3
           WHEN "frequency_rock" = 'Very frequently' THEN 4
           ELSE NULL
       END AS frequency,
       COUNT(*) AS count_freq,
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_rock"
UNION ALL
-- Classical
SELECT 'Classical',
       CASE
           WHEN "frequency_classical" = 'Never' THEN 0
           WHEN "frequency_classical" = 'Rarely' THEN 1
           WHEN "frequency_classical" = 'Sometimes' THEN 2
           WHEN "frequency_classical" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_classical"
UNION ALL
-- EDM
SELECT 'EDM',
       CASE
           WHEN "frequency_edm" = 'Never' THEN 0
           WHEN "frequency_edm" = 'Rarely' THEN 1
           WHEN "frequency_edm" = 'Sometimes' THEN 2
           WHEN "frequency_edm" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_edm"
UNION ALL
-- Jazz
SELECT 'Jazz',
       CASE
           WHEN "frequency_jazz" = 'Never' THEN 0
           WHEN "frequency_jazz" = 'Rarely' THEN 1
           WHEN "frequency_jazz" = 'Sometimes' THEN 2
           WHEN "frequency_jazz" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_jazz"
UNION ALL
-- Lofi
SELECT 'Lofi',
       CASE
           WHEN "frequency_lofi" = 'Never' THEN 0
           WHEN "frequency_lofi" = 'Rarely' THEN 1
           WHEN "frequency_lofi" = 'Sometimes' THEN 2
           WHEN "frequency_lofi" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_lofi"
UNION ALL
-- Hip hop
SELECT 'Hip hop',
       CASE
           WHEN "frequency_hip_hop" = 'Never' THEN 0
           WHEN "frequency_hip_hop" = 'Rarely' THEN 1
           WHEN "frequency_hip_hop" = 'Sometimes' THEN 2
           WHEN "frequency_hip_hop" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_hip_hop"
UNION ALL
-- Pop
SELECT 'Pop',
       CASE
           WHEN "frequency_pop" = 'Never' THEN 0
           WHEN "frequency_pop" = 'Rarely' THEN 1
           WHEN "frequency_pop" = 'Sometimes' THEN 2
           WHEN "frequency_pop" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_pop"
UNION ALL
-- Video game music
SELECT 'Video game music',
       CASE
           WHEN "frequency_video_game_music" = 'Never' THEN 0
           WHEN "frequency_video_game_music" = 'Rarely' THEN 1
           WHEN "frequency_video_game_music" = 'Sometimes' THEN 2
           WHEN "frequency_video_game_music" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_video_game_music"
UNION ALL
-- Country
SELECT 'Country',
       CASE
           WHEN "frequency_country" = 'Never' THEN 0
           WHEN "frequency_country" = 'Rarely' THEN 1
           WHEN "frequency_country" = 'Sometimes' THEN 2
           WHEN "frequency_country" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_country"
UNION ALL
-- Folk
SELECT 'Folk',
       CASE
           WHEN "frequency_folk" = 'Never' THEN 0
           WHEN "frequency_folk" = 'Rarely' THEN 1
           WHEN "frequency_folk" = 'Sometimes' THEN 2
           WHEN "frequency_folk" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_folk"
UNION ALL
-- Gospel
SELECT 'Gospel',
       CASE
           WHEN "frequency_gospel" = 'Never' THEN 0
           WHEN "frequency_gospel" = 'Rarely' THEN 1
           WHEN "frequency_gospel" = 'Sometimes' THEN 2
           WHEN "frequency_gospel" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_gospel"
UNION ALL
-- K-pop
SELECT 'K-pop',
       CASE
           WHEN "frequency_k_pop" = 'Never' THEN 0
           WHEN "frequency_k_pop" = 'Rarely' THEN 1
           WHEN "frequency_k_pop" = 'Sometimes' THEN 2
           WHEN "frequency_k_pop" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_k_pop"
UNION ALL
-- Latin
SELECT 'Latin',
       CASE
           WHEN "frequency_latin" = 'Never' THEN 0
           WHEN "frequency_latin" = 'Rarely' THEN 1
           WHEN "frequency_latin" = 'Sometimes' THEN 2
           WHEN "frequency_latin" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_latin"
UNION ALL
-- Metal
SELECT 'Metal',
       CASE
           WHEN "frequency_metal" = 'Never' THEN 0
           WHEN "frequency_metal" = 'Rarely' THEN 1
           WHEN "frequency_metal" = 'Sometimes' THEN 2
           WHEN "frequency_metal" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_metal"
UNION ALL
-- RnB
SELECT 'RnB',
       CASE
           WHEN "frequency_rnb" = 'Never' THEN 0
           WHEN "frequency_rnb" = 'Rarely' THEN 1
           WHEN "frequency_rnb" = 'Sometimes' THEN 2
           WHEN "frequency_rnb" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_rnb"
UNION ALL
-- Rap
SELECT 'Rap',
       CASE
           WHEN "frequency_rap" = 'Never' THEN 0
           WHEN "frequency_rap" = 'Rarely' THEN 1
           WHEN "frequency_rap" = 'Sometimes' THEN 2
           WHEN "frequency_rap" = 'Very frequently' THEN 3
           ELSE NULL
       END AS frequency,
       COUNT(*),
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY "frequency_rap"
ORDER BY genre, frequency;








--Grouping and Aggregation to Spot Patterns





-- Compare average Anxiety by primary streaming service with rounded values
SELECT primary_streaming_service,
       ROUND(AVG(anxiety), 2) AS avg_anxiety
FROM survey_data
GROUP BY primary_streaming_service
ORDER BY avg_anxiety DESC;

-- Compare average hours_per_day listened across different ages with rounded values and percentages
SELECT age,
       ROUND(AVG(hours_per_day), 2) AS avg_hours,
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage
FROM survey_data_cleaned
GROUP BY age
ORDER BY percentage DESC;

-- Compare average combined score (Depression + Anxiety + OCD + Insomnia) for people who very frequently listen to each genre with rounded values and percentages
SELECT 'Rock' AS genre,
       ROUND(AVG(CASE WHEN "frequency_rock" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_rock" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_rock" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Classical',
       ROUND(AVG(CASE WHEN "frequency_classical" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_classical" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_classical" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Lofi',
       ROUND(AVG(CASE WHEN "frequency_lofi" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_lofi" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_lofi" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Jazz',
       ROUND(AVG(CASE WHEN "frequency_jazz" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_jazz" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_jazz" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Hip hop',
       ROUND(AVG(CASE WHEN "frequency_hip_hop" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_hip_hop" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_hip_hop" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Pop',
       ROUND(AVG(CASE WHEN "frequency_pop" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_pop" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_pop" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Video game music',
       ROUND(AVG(CASE WHEN "frequency_video_game_music" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_video_game_music" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_video_game_music" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Country',
       ROUND(AVG(CASE WHEN "frequency_country" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_country" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_country" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Folk',
       ROUND(AVG(CASE WHEN "frequency_folk" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_folk" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_folk" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Gospel',
       ROUND(AVG(CASE WHEN "frequency_gospel" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_gospel" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_gospel" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'K-pop',
       ROUND(AVG(CASE WHEN "frequency_k_pop" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_k_pop" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_k_pop" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Latin',
       ROUND(AVG(CASE WHEN "frequency_latin" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_latin" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_latin" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Metal',
       ROUND(AVG(CASE WHEN "frequency_metal" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_metal" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_metal" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'RnB',
       ROUND(AVG(CASE WHEN "frequency_rnb" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_rnb" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_rnb" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Rap',
       ROUND(AVG(CASE WHEN "frequency_rap" = 'Very frequently' THEN (depression + anxiety + ocd + insomnia) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_rap" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_rap" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
ORDER BY percentage DESC;

-- Compare average combined score (Depression + Anxiety + OCD) for people who very frequently listen to each genre with rounded values and percentages
SELECT 'Rock' AS genre,
       ROUND(AVG(CASE WHEN "frequency_rock" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_rock" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_rock" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Classical',
       ROUND(AVG(CASE WHEN "frequency_classical" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_classical" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_classical" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Lofi',
       ROUND(AVG(CASE WHEN "frequency_lofi" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_lofi" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_lofi" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Jazz',
       ROUND(AVG(CASE WHEN "frequency_jazz" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_jazz" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_jazz" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Hip hop',
       ROUND(AVG(CASE WHEN "frequency_hip_hop" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_hip_hop" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_hip_hop" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Pop',
       ROUND(AVG(CASE WHEN "frequency_pop" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_pop" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_pop" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Video game music',
       ROUND(AVG(CASE WHEN "frequency_video_game_music" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_video_game_music" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_video_game_music" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Country',
       ROUND(AVG(CASE WHEN "frequency_country" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_country" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_country" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Folk',
       ROUND(AVG(CASE WHEN "frequency_folk" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_folk" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_folk" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Gospel',
       ROUND(AVG(CASE WHEN "frequency_gospel" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_gospel" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_gospel" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'K-pop',
       ROUND(AVG(CASE WHEN "frequency_k_pop" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_k_pop" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_k_pop" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Latin',
       ROUND(AVG(CASE WHEN "frequency_latin" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_latin" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_latin" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Metal',
       ROUND(AVG(CASE WHEN "frequency_metal" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_metal" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_metal" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'RnB',
       ROUND(AVG(CASE WHEN "frequency_rnb" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_rnb" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_rnb" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
UNION ALL
SELECT 'Rap',
       ROUND(AVG(CASE WHEN "frequency_rap" = 'Very frequently' THEN (depression + anxiety + ocd) ELSE NULL END), 2) AS avg_combined_score,
       ROUND((COUNT(CASE WHEN "frequency_rap" = 'Very frequently' THEN 1 ELSE NULL END) * 100.0) / (SELECT COUNT(*) FROM survey_data_cleaned), 2) AS percentage,
       ROUND(AVG(CASE WHEN "frequency_rap" = 'Very frequently' THEN CASE WHEN music_effects = 'Worsen' THEN 0 WHEN music_effects = 'No effect' THEN 1 WHEN music_effects = 'Improve' THEN 2 ELSE NULL END ELSE NULL END), 2) AS avg_music_effects
FROM survey_data_cleaned
ORDER BY percentage DESC;




--Next we can see how the amount of hours of listening per day correlate with someone's feeling and if the music makes them feel better
SELECT
  CASE 
    WHEN hours_per_day < 1 THEN '0-1 hour'
    WHEN hours_per_day < 2 THEN '1-2 hours'
    WHEN hours_per_day < 3 THEN '2-3 hours'
    WHEN hours_per_day < 4 THEN '3-4 hours'
    WHEN hours_per_day < 8 THEN '4-8 hours'
    WHEN hours_per_day < 12 THEN '8-12 hours'
    WHEN hours_per_day < 16 THEN '12-16 hours'
    WHEN hours_per_day < 20 THEN '16-20 hours'
    ELSE '20+ hours'
  END AS hours_bin,
  ROUND(AVG(anxiety + depression + insomnia + ocd), 2) AS avg_combined_sadness_score,
  ROUND(AVG(CASE 
    WHEN music_effects = 'Worsen' THEN 0
    WHEN music_effects = 'No effect' THEN 1
    WHEN music_effects = 'Improve' THEN 2
    ELSE NULL
  END), 2) AS avg_music_effects_numeric
FROM survey_data_cleaned
GROUP BY hours_bin
ORDER BY avg_combined_sadness_score DESC;









---Example of Identifying Potential Correlations





-- Group combined feeling levels into low (0-12), medium (13-24), and high (25-40).
-- Then count how often they occur for "frequency_pop" categories:

SELECT
  "frequency_pop" AS pop_freq,
  CASE
    WHEN (anxiety + depression + insomnia + ocd) BETWEEN 0 AND 12 THEN 'Low Combined Feeling'
    WHEN (anxiety + depression + insomnia + ocd) BETWEEN 13 AND 24 THEN 'Medium Combined Feeling'
    ELSE 'High Combined Feeling'
  END AS combined_feeling_level,
  COUNT(*) AS count_pop_combined_feeling
FROM survey_data_cleaned
GROUP BY "frequency_pop", combined_feeling_level
ORDER BY pop_freq, combined_feeling_level;









----Complete analysis with visualisation and reporting will be done in Excel