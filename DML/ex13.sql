with counts as (
    select p.k_ime_od as k_ime, p.naslov as naslov, count(*) as broj
    from Preporaka as p
    group by k_ime, naslov
),
max_per_user as (
    select k_ime, max(broj) as max_broj
    from counts
    group by k_ime
)
select c.k_ime, c.naslov, c.broj
from counts as c
join max_per_user as m on m.k_ime = c.k_ime and m.max_broj = c.broj;