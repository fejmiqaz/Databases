with count_museums as (
    select m.museum_code, m.museum_name, count(distinct ea.artwork_code) as counter
    from Museum as m
    join Exhibition as e on e.museum_code = m.museum_code
    join ExhibitedArtwork as ea on ea.exhibition_id = e.exhibition_id
    where ea.start_date >= '2023-01-01' and ea.end_date < '2024-01-01'
    group by m.museum_name
)

select museum_name
from count_museums
where counter = (select max(counter) from count_museums)