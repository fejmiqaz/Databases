select m.umetnik
from Umetnicko_delo as m
where not exists (
    select m1.umetnik
    from Umetnicko_delo as m1
    join Izlozeni as i on i.shifra_d = m1.shifra
    join Izlozba_UD as iud on iud.ime_i = i.ime_i
    join Izlozba as iz on iz.ime_i = iud.ime_i
    join Muzej as mz on mz.shifra = iz.shifra_muzej
    where m1.umetnik = m.umetnik and mz.tip like 'zatvoreno'
)
order by m.umetnik;