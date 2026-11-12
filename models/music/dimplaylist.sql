{{ config(materialized='table', tags=['star']) }}
 -- Join of PLAYLISTTRACK und PLAYLIST table. Analog to "my_first_joint" example

-- 1. raw table PlaylistTrack 
with PLAYLISTTRACK as (
    select * from {{source('music','PLAYLISTTRACK')}}
),

-- 2. raw table PLAYLIST
PLAYLIST as (
    select * from {{source('music','PLAYLIST')}}
),

--join both table and columns 
final as (
    select 
        PLAYLISTTRACK.PlaylistId as playlist_id,
        PLAYLISTTRACK.TrackId as track_id,
        PLAYLIST.name as playlist_name
    from PLAYLISTTRACK
    join PLAYLIST
        on PLAYLISTTRACK.PlaylistId = PLAYLIST.PlaylistId
)
select * from final  
