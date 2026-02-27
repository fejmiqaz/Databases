select a.artist from Artwork as a
where not exists(
    select a1.artist from Artwork as a1
    join ExhibitedArtwork as ea on ea.artwork_code = a1.artwork_code
    join Exhibition as e on e.exhibition_id = ea.exhibition_id
    join Museum as m on m.museum_code = e.museum_code
    where a.artist = a1.artist and m.type like 'INDOOR'
)
order by a.artist;