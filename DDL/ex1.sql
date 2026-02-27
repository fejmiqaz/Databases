create table Museum(
    museum_code text primary key,
    museum_name text,
    description text,
    city text,
    type text check (type in('OPEN_AIR', 'INDOOR')),
    working_hours text,
    check (type <> 'OPEN_AIR' or museum_code like 'o%')
);

create table Artwork(
    artwork_code text primary key,
    name text,
    year text,
    artist text
);
create table ExhibitedArtwork(
    artwork_code text,
    exhibition_id text,
    start_date text,
    end_date text,
    primary key (artwork_code, exhibition_id),
    foreign key (artwork_code) references Artwork(artwork_code) on delete cascade on update cascade,
    foreign key (exhibition_id) references ArtworkExhibition(exhibition_id) on delete cascade on update cascade
);