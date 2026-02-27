create trigger tr1
after insert on Poseta
for each row
begin
    update Mesto
    set broj_poseti = (
        select count(distinct(p.kor_ime))
        from Poseta as p
        where p.id_mesto = new.id_mesto
    )
    where id = new.id_mesto;
end;