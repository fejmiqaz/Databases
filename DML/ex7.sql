select distinct k.ime, k.prezime
from Korisnik as k
join Poseta as p1 on p1.kor_ime = k.kor_ime
join Poseta as p2 on p2.kor_ime = k.kor_ime
join Objekt as o1 on o1.id_mesto = p1.id_mesto
join Objekt as o2 on o2.id_mesto = p2.id_mesto
join Sosedi as s on (s.grad1 = o1.id_grad and s.grad2 = o2.id_grad) or (s.grad1 = o2.id_grad and s.grad2 = o1.id_grad)
where s.rastojanie < 300