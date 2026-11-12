{{ config(materialized='table', tags=['star']) }}
 -- Join of ALBUM and ARTIST table. Analog to "my_first_joint" example

-- 1. raw table ALBUM 
with album as (
    select * from {{source('music','ALBUM')}}
),

-- 2. raw table ARTIST
ARTIST as (
    select * from {{source('music','ARTIST')}}
),

--join both table and columns 
final as (
    select 
        Album.AlbumId as album_id,
        Album.Title as album_title,
        Album.ProductionYear as album_ProductionYear,
        Album.CD_number as album_cd_number,
        Artist.ArtistId AS artist_id,
        Artist.Name as artist_name,
        Artist.BirthYear as artist_Birthyear,
        Artist.Country as artist_country
    from ALBUM
    join ARTIST
        on ALBUM.ArtistId = ARTIST.ArtistId
)
select * from final  
