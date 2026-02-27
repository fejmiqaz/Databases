create table Trka(
    ime text primary key,
    krugovi int,
    pateka text,
    foreign key (pateka) references Pateka(ime) on delete cascade on update cascade,
    check (krugovi <= 80)
);

create table Odrzana_trka(
    ime text,
    datum text,
    vreme text,
    foreign key (ime) references Trka(ime) on delete cascade on update cascade,
    primary key (ime,datum)
);

create table Ucestvuva(
    ID text primary key,
    vozacki_broj text,
    ime_tim text,
    ime_trka text,
    datum_trka text,
    pocetna_p text,
    krajna_p text,
    poeni real,
    foreign key (ime_trka, datum_trka) references Odrzana_trka(ime, datum) on delete cascade on update cascade,
    foreign key (ime_tim) references Tim(ime) on delete cascade on update cascade,
    foreign key (vozacki_broj) references Vozac(vozacki_broj) on delete set null on update cascade,
    check (krajna_p <= 10 or poeni = 0)
);