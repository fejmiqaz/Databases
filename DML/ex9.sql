select distinct lz.k_ime, lz.naslov
from Lista_zelbi as lz
join Profil as pr on pr.k_ime = lz.k_ime
join Premium_korisnik as pk on pk.k_ime = pr.k_ime
join Preporaka as p on p.k_ime_na = pk.k_ime and p.naslov = lz.naslov
where p.ocena > 3 and p.datum >= '2021-01-01' and p.datum < '2022-01-01'
order by lz.k_ime;