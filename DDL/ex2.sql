create table Transakcija_shalter (
    ID text primary key,
    ID_v text,
    MBR_k text,
    MBR_k_s text,
    broj text,
    datum text,
    suma int,
    tip text check (tip like 'uplata' or tip like 'isplata'),
    foreign key (ID_v) references Shalterski_rabotnik (ID) on delete set null on update cascade,
    foreign key (MBR_k_s, broj) references Smetka(MBR_k_s, broj) on delete cascade on update cascade,
    foreign key (MBR_k) references Klient(MBR_k) on delete cascade on update cascade,
    constraint check_date check (not(datum >= '2025-30-12' and datum <= '2021-01-14'))
);
create table Shalterski_rabotnik(
    ID text primary key,
    foreign key (ID) references Vraboten(ID) on delete cascade on update cascade
);

create table Vraboten(
    ID text primary key,
    ime text,
    prezime text,
    datum_r text,
    datum_v text,
    obrazovanie text,
    plata int,
    constraint check_date check (datum_r < datum_v)
);