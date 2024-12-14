# Music & Mental Health Interactive Visualisation

## Overview
This project was originaly meant to analyze the relationship between music listening habits and mental health based on the "Music & Mental Health Survey Results" dataset. However, after some thought I decided to start working on a financial analysis project and this one ended up as an interactive visualisation of Music and Mental Health data correlation.

## Data
The dataset contains responses to questions about musical background, listening habits, and mental health status.

### Columns
- `Timestamp`: Time of survey completion
- `Age`: Age of the respondent
- `Primary streaming service`: Music streaming service used
- `Hours per day`: Hours spent listening to music per day
- `While working`: Whether music is listened to while working
- `Instrumentalist`: Whether the respondent plays an instrument
- `Composer`: Whether the respondent composes music
- `Fav genre`: Favorite genre of music
- `Exploratory`: Whether the respondent explores new music
- `Foreign languages`: Whether the respondent listens to music in foreign languages
- `BPM`: Average beats per minute of preferred music
- `Frequency [Genre]`: Frequency of listening to different music genres
- `Anxiety`: Self-reported anxiety level (0-10)
- `Depression`: Self-reported depression level (0-10)
- `Insomnia`: Self-reported insomnia level (0-10)
- `OCD`: Self-reported OCD level (0-10)
- `Music effects`: Effects of music on mental health
- `Permissions`: Permissions for using the data

### Contents
There are currently five files uploaded: two SQL scripts, .csv source dataset, .db database an Excel file. One of the scripts cleans and transforms the data so it can be easily used in Excel. The second script performs some basic exploratory data analysis. The Excel file expands the raw data to include bins and provides and interactive visualisation.
