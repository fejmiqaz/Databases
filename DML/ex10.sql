select b1.ime as B1, b2.ime as B2
from Bend as b1
join Bend as b2 on b2.godina_osnovanje = b1.godina_osnovanje and b1.ime > b2.ime
order by B1 asc, B2 desc;