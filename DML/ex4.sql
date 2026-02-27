select l.id
from Lice as l
where exists(
    select 1 from Lice as l2
    join Test as t on t.id = l2.id
    join Vakcinacija_datum as vd on vd.id_lice = l2.id
    where t.rezultat = 'pozitiven' and vd.datum > t.datum and l.id = l2.id
)
order by l.id;