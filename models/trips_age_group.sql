select
    "group" as age_group, 
    count(1) as trips, 
    sum(price_rub) as revenue_rub
from {{ref("trips_users")}} tu
left join {{ref("age_groups")}} ag on ag.age_start<=tu.age and ag.age_end>tu.age
group by 1 