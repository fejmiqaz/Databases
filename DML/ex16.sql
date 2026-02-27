with count_muzej as (
    select m.ime_muzej, count(m.ime_muzej) as counter
    from Muzej as m
    join Izlozba as iz on iz.shifra_muzej = m.shifra
    join Izlozba_UD as iud on iud.ime_i = iz.ime_i
    join Izlozeni as i on i.ime_i = iud.ime_i
    join Umetnicko_delo as ud on ud.shifra = i.shifra_d
    where iz.datum_od >= '2023-01-01' and iz.datum_do < '2024-01-01'
)
select ime_muzej
from count_muzej
where counter = (select distinct max(counter) from count_muzej)