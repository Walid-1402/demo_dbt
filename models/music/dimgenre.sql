{{ config(materialized='table', tags=['star']) }} 

SELECT
    GenreId as genre_id,        
    Name as genre_name          
From {{source('music', 'GENRE')}} 