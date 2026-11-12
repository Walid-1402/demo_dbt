{{ config(materialized='table', tags=['star']) }} 

SELECT
    MediaTypeId as MediaType_id,       --primary key of the media type
    Name as MediaType_name             -- name of media typ
From {{source('music', 'MEDIATYPE')}}  -- from? : raw table from MUSIC_DB
 