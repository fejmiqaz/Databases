create table Video_zapis(
    naslov text primary key,
    jazik text,
    vremetraenje text,
    datum_d text,
    datum_p text
);

create table Video_zapis_zanr (
    naslov text,
    zanr text,
    foreign key (naslov) references Video_zapis(naslov) on delete cascade on update cascade,
    primary key (naslov, zanr)
);

create table Preporaka (
    ID text primary key,
    k_ime_od text,
    k_ime_na text,
    naslov text,
    datum date,
    komentar text,
    ocena int,
    foreign key (k_ime_od) references Korisnik(k_ime) on delete set null on update cascade,
    foreign key (k_ime_na) references Korisnik(k_ime) on delete cascade on update cascade,
    foreign key (naslov) references Video_zapis(naslov) on delete cascade on update cascade,
    check (k_ime_od <> k_ime_na),
    check (datum < "2025-12-19")
);