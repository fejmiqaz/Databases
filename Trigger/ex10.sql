create trigger tr1
after insert on Izlozeni
for each row
begin
    update Umetnicko_delo
    set br_izlozbi_otvoreno = (
        select count(distinct i.ime_i)
        from Izlozeni as i
        join Izlozba as ib on ib.ime_i = i.ime_i
        join Muzej as m on m.shifra = ib.shifra_muzej
        where m.tip like 'otvoreno' and i.shifra_d = new.shifra_d
        
    ),
    br_izlozbi_zatvoreno = (
        select count(distinct i.ime_i)
        from Izlozeni as i
        join Izlozba as ib on ib.ime_i = i.ime_i
        join Muzej as m on m.shifra = ib.shifra_muzej
        where m.tip like 'zatvoreno' and i.shifra_d = new.shifra_d
    )
    where shifra = new.shifra_d;
end;