create trigger tr1
after insert on Vakcinacija_datum
for each row
begin
    update Lice
    set celosno_imuniziran =
        case
            when(
                select count(*) from Vakcinacija_datum as vd
                where vd.id_lice = new.id_lice
            ) >= 2 then 1
            else 0
        end
    where id = new.id_lice;
end;