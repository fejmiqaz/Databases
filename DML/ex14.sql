select ud.ime, ud.umetnik
from Umetnicko_delo as ud
join Izlozeni as i on i.shifra_d = ud.shifra
join Izlozba_UD as iud on iud.ime_i = i.ime_i
join Izlozba as iz on iz.ime_i = iud.ime_i
where i.datum_pocetok <= iz.datum_od and i.datum_kraj >= iz.datum_do
order by ud.ime;