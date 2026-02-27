select distinct k.ime, prezime
from Korisnik as k
join Poseta as p1 on p1.kor_ime = k.kor_ime
join Poseta as p2 on p2.kor_ime = k.kor_ime and p1.datum = p2.datum
join Objekt as o1 on o1.id_mesto = p1.id_mesto
join Objekt as o2 on o2.id_mesto = p2.id_mesto
join Grad as g1 on g1.id_mesto = o1.id_grad
join Grad as g2 on g2.id_mesto = o2.id_grad
join Sosedi as s 
on (s.grad1 = g1.id_mesto and s.grad2 = g2.id_mesto)
or (s.grad1 = g2.id_mesto and s.grad2 = g1.id_mesto)
order by k.ime, k.ime