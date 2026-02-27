create trigger tr1
after insert on Preporaka
for each row
begin
    update Video_zapis
    set prosechna_ocena = (
        select avg(p.ocena)
        from Preporaka as p
        where p.naslov = new.naslov
    )
    where naslov = new.naslov;
end;