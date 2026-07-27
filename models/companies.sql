select 
    company,
    count(1) as models,
    sum(scooters) as scooters
from {{ref("scooters")}}
group by 1