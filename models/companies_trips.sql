with trips_by_company as 
   (select 
   	    s.company,
   	    count(1) cnt
    from {{ref("trips_prep")}} tp
    join {{ref("scooters")}} s on tp.scooter_hw_id = s.hardware_id 
    group by 1)
select 
    tbc.company,
    c.scooters,
    tbc.cnt/c.scooters as trips_per_scooter
from trips_by_company tbc
join {{ref("companies")}} c on c.company = tbc.company