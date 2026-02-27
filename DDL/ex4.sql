CREATE TABLE Bend (
    id text primary key,
    ime text,
    godina_osnovanje int check (godina_osnovanje >= 1970)
);
create table Bend_zanr (
    id_bend text,
    zanr text,
    foreign key (id_bend) references Bend(id) on delete cascade on update cascade,
    primary key (id_bend, zanr)
);

create table Festival_bend(
    id_festival text,
    datum_od text,
    id_bend text,
    foreign key (id_festival, datum_od) references Festival_odrzuvanje(id, datum_od) on delete cascade on update cascade,
    foreign key (id_bend) references Bend (id) on delete set default on update cascade,
    primary key (id_festival, datum_od, id_bend),
    constraint ch1 check (not(id_bend = 5 and id_festival = 2))
);