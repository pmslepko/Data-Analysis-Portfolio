SELECT * FROM survey_data;

-- This shows the first 10 rows to understand the data structure better
SELECT * FROM survey_data LIMIT 10;

-- Check for NULLs in important columns
SELECT COUNT(*) AS null_count
FROM survey_data
WHERE age IS NULL
   OR hours_per_day IS NULL
   OR while_working IS NULL
   OR instrumentalist IS NULL
   OR composer IS NULL
   OR fav_genre IS NULL
   OR exploratory IS NULL
   OR foreign_languages IS NULL
   OR BPM IS NULL
   OR Frequency_Classical IS NULL
   OR Frequency_Country IS NULL
   OR Frequency_EDM IS NULL
   OR Frequency_Folk IS NULL
   OR Frequency_Gospel IS NULL
   OR Frequency_Hip_hop IS NULL
   OR Frequency_Jazz IS NULL
   OR Frequency_K_pop IS NULL
   OR Frequency_Latin IS NULL
   OR Frequency_Lofi IS NULL
   OR Frequency_Metal IS NULL
   OR Frequency_Pop IS NULL
   OR Frequency_RnB IS NULL
   OR Frequency_Rap IS NULL
   OR Frequency_Rock IS NULL
   OR Frequency_Video_game_music IS NULL
   OR Anxiety IS NULL
   OR Depression IS NULL
   OR Insomnia IS NULL
   OR OCD IS NULL
   OR Music_effects IS NULL;

  --The null count turns out to be 119. We will now verify which rows are null.
  SELECT * FROM survey_data
WHERE age IS NULL
   OR hours_per_day IS NULL
   OR while_working IS NULL
   OR instrumentalist IS NULL
   OR composer IS NULL
   OR fav_genre IS NULL
   OR exploratory IS NULL
   OR foreign_languages IS NULL
   OR BPM IS NULL
   OR Frequency_Classical IS NULL
   OR Frequency_Country IS NULL
   OR Frequency_EDM IS NULL
   OR Frequency_Folk IS NULL
   OR Frequency_Gospel IS NULL
   OR Frequency_Hip_hop IS NULL
   OR Frequency_Jazz IS NULL
   OR Frequency_K_pop IS NULL
   OR Frequency_Latin IS NULL
   OR Frequency_Lofi IS NULL
   OR Frequency_Metal IS NULL
   OR Frequency_Pop IS NULL
   OR Frequency_RnB IS NULL
   OR Frequency_Rap IS NULL
   OR Frequency_Rock IS NULL
   OR Frequency_Video_game_music IS NULL
   OR Anxiety IS NULL
   OR Depression IS NULL
   OR Insomnia IS NULL
   OR OCD IS NULL
   OR Music_effects IS NULL;
   
  --Turns out a lot of the surveyed people did not answer the BPM question. It is not unexpected as it is rather difficult to describe without musical background.
  
  --For the purpose of this study we will not delete the rows that do not have BPM information.
  
  --We will once again check how many rows are null. This time without BPM column.
  SELECT COUNT(*) AS null_count
FROM survey_data
WHERE age IS NULL
   OR hours_per_day IS NULL
   OR while_working IS NULL
   OR instrumentalist IS NULL
   OR composer IS NULL
   OR fav_genre IS NULL
   OR exploratory IS NULL
   OR foreign_languages IS NULL
   OR Frequency_Classical IS NULL
   OR Frequency_Country IS NULL
   OR Frequency_EDM IS NULL
   OR Frequency_Folk IS NULL
   OR Frequency_Gospel IS NULL
   OR Frequency_Hip_hop IS NULL
   OR Frequency_Jazz IS NULL
   OR Frequency_K_pop IS NULL
   OR Frequency_Latin IS NULL
   OR Frequency_Lofi IS NULL
   OR Frequency_Metal IS NULL
   OR Frequency_Pop IS NULL
   OR Frequency_RnB IS NULL
   OR Frequency_Rap IS NULL
   OR Frequency_Rock IS NULL
   OR Frequency_Video_game_music IS NULL
   OR Anxiety IS NULL
   OR Depression IS NULL
   OR Insomnia IS NULL
   OR OCD IS NULL
   OR Music_effects IS NULL;
  
 --This time we got 17 rows that are null.
 --We will once again check the null rows.
   SELECT * FROM survey_data
WHERE age IS NULL
   OR hours_per_day IS NULL
   OR while_working IS NULL
   OR instrumentalist IS NULL
   OR composer IS NULL
   OR fav_genre IS NULL
   OR exploratory IS NULL
   OR foreign_languages IS NULL
   OR Frequency_Classical IS NULL
   OR Frequency_Country IS NULL
   OR Frequency_EDM IS NULL
   OR Frequency_Folk IS NULL
   OR Frequency_Gospel IS NULL
   OR Frequency_Hip_hop IS NULL
   OR Frequency_Jazz IS NULL
   OR Frequency_K_pop IS NULL
   OR Frequency_Latin IS NULL
   OR Frequency_Lofi IS NULL
   OR Frequency_Metal IS NULL
   OR Frequency_Pop IS NULL
   OR Frequency_RnB IS NULL
   OR Frequency_Rap IS NULL
   OR Frequency_Rock IS NULL
   OR Frequency_Video_game_music IS NULL
   OR Anxiety IS NULL
   OR Depression IS NULL
   OR Insomnia IS NULL
   OR OCD IS NULL
   OR Music_effects IS NULL;
   
 --There are no further standouts so we will delete the null rows.
 DELETE FROM survey_data
WHERE age IS NULL
   OR hours_per_day IS NULL
   OR while_working IS NULL
   OR instrumentalist IS NULL
   OR composer IS NULL
   OR fav_genre IS NULL
   OR exploratory IS NULL
   OR foreign_languages IS NULL
   OR Frequency_Classical IS NULL
   OR Frequency_Country IS NULL
   OR Frequency_EDM IS NULL
   OR Frequency_Folk IS NULL
   OR Frequency_Gospel IS NULL
   OR Frequency_Hip_hop IS NULL
   OR Frequency_Jazz IS NULL
   OR Frequency_K_pop IS NULL
   OR Frequency_Latin IS NULL
   OR Frequency_Lofi IS NULL
   OR Frequency_Metal IS NULL
   OR Frequency_Pop IS NULL
   OR Frequency_RnB IS NULL
   OR Frequency_Rap IS NULL
   OR Frequency_Rock IS NULL
   OR Frequency_Video_game_music IS NULL
   OR Anxiety IS NULL
   OR Depression IS NULL
   OR Insomnia IS NULL
   OR OCD IS NULL
   OR Music_effects IS NULL;

   --Let us check whether it worked.
     SELECT COUNT(*) AS null_count
FROM survey_data
WHERE age IS NULL
   OR hours_per_day IS NULL
   OR while_working IS NULL
   OR instrumentalist IS NULL
   OR composer IS NULL
   OR fav_genre IS NULL
   OR exploratory IS NULL
   OR foreign_languages IS NULL
   OR Frequency_Classical IS NULL
   OR Frequency_Country IS NULL
   OR Frequency_EDM IS NULL
   OR Frequency_Folk IS NULL
   OR Frequency_Gospel IS NULL
   OR Frequency_Hip_hop IS NULL
   OR Frequency_Jazz IS NULL
   OR Frequency_K_pop IS NULL
   OR Frequency_Latin IS NULL
   OR Frequency_Lofi IS NULL
   OR Frequency_Metal IS NULL
   OR Frequency_Pop IS NULL
   OR Frequency_RnB IS NULL
   OR Frequency_Rap IS NULL
   OR Frequency_Rock IS NULL
   OR Frequency_Video_game_music IS NULL
   OR Anxiety IS NULL
   OR Depression IS NULL
   OR Insomnia IS NULL
   OR OCD IS NULL
   OR Music_effects IS NULL;
   
 --null count is 0. Success. Now we have reasonably cleared the data.
 --Let's see the first 10 once again and decide how to move forward.
  SELECT * FROM survey_data LIMIT 10;
  
 --The Timestamp and Permissions columns are useless for the purpose of this analysis so we will get rid of them.
--Create a new table without Timestamp and Permissions columns

CREATE TABLE survey_data_cleaned AS
SELECT age, hours_per_day, while_working, instrumentalist, composer, fav_genre,
       exploratory, foreign_languages, Frequency_Classical, Frequency_Country, 
       Frequency_EDM, Frequency_Folk, Frequency_Gospel, Frequency_Hip_hop, 
       Frequency_Jazz, Frequency_K_pop, Frequency_Latin, Frequency_Lofi, 
       Frequency_Metal, Frequency_Pop, Frequency_RnB, Frequency_Rap, 
       Frequency_Rock, Frequency_Video_game_music, Anxiety, Depression, 
       Insomnia, OCD, Music_effects
FROM survey_data;

-- Verify by selecting the first 10 rows from the cleaned table
SELECT * FROM survey_data_cleaned LIMIT 10;


-- Create a new table 'survey_data_transformed' with the required changes
CREATE TABLE survey_data_transformed AS
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
    WHEN Frequency_Video_game_music = 'Sometimes' THEN 2
    WHEN Frequency_Video_game_music = 'Very frequently' THEN 3
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