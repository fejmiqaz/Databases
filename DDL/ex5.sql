create table Korisnik (
    kor_ime text primary key,
    ime text,
    prezime text,
    pol text,
    data_rag date,
    data_reg date,
    constraint check1 check (data_rag < data_reg)
);

create table Korisnik_email(
    kor_ime text,
    email text check (email like '%.com' and length(email) >= 10),
    foreign key (kor_ime) references Korisnik(kor_ime) on delete cascade on update cascade,
    primary key (kor_ime, email)
);

create table Poseta (
    id text primary key,
    kor_ime text,
    id_mesto text,
    datum text,
    foreign key (kor_ime) references Korisnik(kor_ime) on delete set null on update cascade,
    foreign key (id_mesto) references Mesto(id) on delete cascade on update cascade,
    constraint check1 check (datum <= DATE())
);