-- Ejercicios de practicas de consultas SQL

-- 1. Listar todas las canciones de Iron Maiden 

select t.name 
from artists ar 
    join albums al on ar.artistid = al.artistid 
    join tracks t on al.albumid = t.albumid 
where ar.name like '%Iron Maiden%';


-- 2. Listar los discos con mas de 25 canciones

select a.title, count(t.trackid) 
from albums a 
    join tracks t on a.albumid = t.albumid 
group by a.title 
having count(t.trackid) > 25;


-- 3. Listar las canciones mas populares (Canciones que están en mas playlists)

select t.name, count(pt.playlistid) as 'N of Playlists' 
from tracks t join playlist_track pt on t.trackid = pt.trackid 
group by t.trackid 
order by count(pt.playlistid) desc 
limit 10;