select distinct m.ime, m.prezime
from Muzicar as m
join Muzicar_instrument as mi on mi.id_muzicar = m.id
join Muzicar_bend as mb on mi.id_muzicar = mb.id_muzicar
join Koncert_muzicar_bend as kmb on kmb.id_muzicar = mi.id_muzicar
join Koncert as k on k.id = kmb.id_koncert
where mi.instrument = 'gitara' and k.datum > mb.datum_napustanje
order by m.ime;