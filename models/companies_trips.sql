with trips_by_company as (
    select
        s.company,
        count(*) as cnt
    from {{ ref("trips_prep") }} as tp
    inner join {{ ref("scooters") }} as s on tp.scooter_hw_id = s.hardware_id
    group by 1
)

select
    tbc.company,
    c.scooters,
    tbc.cnt / c.scooters as trips_per_scooter
from trips_by_company as tbc
inner join {{ ref("companies") }} as c on tbc.company = c.company
