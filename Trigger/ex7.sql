create trigger tr1
after insert on Poseta
for each row
begin
    update Korisnik
    set broj_poseti =(
        select count(distinct(p.id_mesto))
        from Poseta as p
        where p.kor_ime = new.kor_ime
    )
    where kor_ime = new.kor_ime;
end;