create table Muzej(
    shifra text primary key not null,
    ime_muzej text,
    opis text,
    grad text,
    tip text check(tip in('otvoreno', 'zatvoreno')),
    rabotno_vreme text,
    check (tip <> 'otvoreno' or shifra like 'o%')
);
create table Umetnicko_delo (
    shifra text primary key not null,
    ime text,
    godina text,
    umetnik text
);
create table Izlozeni (
    shifra_d text,
    ime_i text,
    datum_pocetok text,
    datum_kraj text,
    foreign key (shifra_d) references Umetnicko_delo(shifra) on delete cascade on update cascade,
    foreign key (ime_i) references Izlozba_UD(ime_i) on delete set default on update cascade,
    primary key (shifra_d, ime_i)
);