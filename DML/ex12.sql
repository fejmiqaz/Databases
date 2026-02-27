with given_max as (
    select p.k_ime_od as k_ime, count(*) as given_cnt
    from Preporaka as p
    group by p.k_ime_od
),
top_giver as (
    select k_ime
    from given_max
    where given_cnt = (select max(given_cnt) from given_max)
)

select tg.k_ime, count(p2.naslov) as dobieni_preporaki
from top_giver as tg
left join Preporaka as p2 on p2.k_ime_na = tg.k_ime
group by tg.k_ime;