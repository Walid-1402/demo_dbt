{{ config(materialized='table', tags=['star']) }} 

SELECT
    TrackId as track_id,
    Title as track_titel,
    AlbumId as album_id,
    Composer as track_composer,
    GenreId as genre_id,
    MediaTypeId as MediaType_id,
    Milliseconds as milliseconds,
    Bytes as bytes,
    UnitPrice as unitPrice          
From {{source('music', 'TRACK')}} 