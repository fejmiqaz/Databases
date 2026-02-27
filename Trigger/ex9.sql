create trigger tr1
before delete on Vozac
for each row
begin
    update Ucestvuva
    set vozacki_broj = null
    where vozacki_broj = old.vozacki_broj;
end;

create trigger tr2
before delete on Tim
for each row
begin
    delete from Ucestvuva
    where ime_tim = old.ime;
end;