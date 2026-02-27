create trigger tr1
after insert on Muzicar_bend
for each row
begin
    update Muzicar
    set br_bendovi = (
        select count(*)
        from Muzicar_bend as mb
        where mb.id_muzicar = new.id_muzicar
    )
    where id = new.id_muzicar;
end;