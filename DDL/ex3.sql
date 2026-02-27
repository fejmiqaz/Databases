create table Vakcinacija(
    id_lice text,
    id_med_lice text,
    shifra_vakcina text,
    foreign key (id_lice) references Lice(id) on delete set default on update cascade,
    foreign key (id_med_lice) references Med_lice(id) on delete set default on update cascade,
    foreign key (shifra_vakcina) references Vakcina(shifra) on delete set default on update cascade,
    primary key (id_lice, id_med_lice, shifra_vakcina),
    constraint check_med check (id_lice <> id_med_lice)
);
create table Vakcinacija_datum(
    id_lice text,
    id_med_lice text,
    shifra_vakcina text,
    datum date,
    foreign key (id_lice, id_med_lice, shifra_vakcina) references Vakcinacija(id_lice, id_med_lice, shifra_vakcina) on delete set null on update cascade,
    primary key (id_lice, id_med_lice, shifra_vakcina, datum),
    constraint check_med check (id_lice <> id_med_lice)
);

create table Test (
    id text,
    shifra text,
    tip text,
    datum text,
    rezultat text,
    laboratorija text,
    primary key (id, shifra),
    foreign key (id) references Lice(id) on delete cascade on update cascade,
    constraint check1 check (laboratorija <> 'lab-abc' or tip like 'seroloshki')
);