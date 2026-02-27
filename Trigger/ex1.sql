create trigger tr1
after insert on ExhibitedArtwork
for each row
begin
    update Artwork
    set
        count_open_air_exhb = (
            select count(ea.exhibition_id)
            from ExhibitedArtwork as ea
            join Exhibition as e on e.exhibition_id = ea.exhibition_id
            join Museum as m on m.museum_code = e.museum_code
            where m.type = 'OPEN_AIR' and ea.artwork_code = new.artwork_code
        ),
        count_indoor_exhb = (
            select count(ea.exhibition_id)
            from ExhibitedArtwork as ea
            join Exhibition as e on e.exhibition_id = ea.exhibition_id
            join Museum as m on m.museum_code = e.museum_code
            where m.type = 'INDOOR' and ea.artwork_code = new.artwork_code
        )
    where artwork_code = new.artwork_code;
end;