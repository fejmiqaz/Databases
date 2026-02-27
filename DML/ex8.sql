select distinct k.ime, k.prezime
from Korisnik as k
join Premium_korisnik as pk on pk.k_ime = k.k_ime
join Preporaka as p on p.k_ime_od = pk.k_ime
join Video_zapis as vz on vz.naslov = p.naslov
where vz.vremetraenje > 120 and p.ocena >= 4
order by k.datum_reg;