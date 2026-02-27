select m.ime 
from Mesto as m
join Grad as g on g.id_mesto = m.id
join Objekt as o on o.id_grad = g.id_mesto
join Poseta as p on p.id_mesto = o.id_mesto
group by m.id, m.ime
order by count(*) desc
limit 1;
