create table Lista_zelbi(
    ID text primary key,
    naslov text,
    k_ime text,
    ime text,
    foreign key (naslov) references Video_zapis(naslov) on delete set null on update cascade,
    foreign key (k_ime, ime) references Profil(k_ime, ime) on delete cascade on update cascade
);
create table Korisnik(
    k_ime text primary key,
    ime text,
    prezime text,
    tip text,
    pretplata text,
    datum_reg text,
    tel_broj text,
    email text,
    constraint check1 check (not(datum_reg <= '2015-01-01' and pretplata like 'pretplata 3'))
);

create table Premium_korisnik (
    k_ime text primary key,
    datum text,
    procent_popust int default 10,
    foreign key (k_ime) references Korisnik(k_ime) on delete cascade on update cascade
);