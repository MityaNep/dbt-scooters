
select
    t.id,
    t.user_id,
    t.scooter_hw_id,
    t.started_at,
    t.finished_at,
    t.start_lat,
    t.start_lon,
    t.finish_lat,
    t.finish_lon,
    t.distance_m,
    t.price_rub,
    t.duration_s,
    t.is_free,
    t.date,
    u.sex,
    extract(year from t.started_at) - extract(year from u.birth_date) as age
from {{ref("trips_prep")}} as t
left join {{source("scooters_raw","users")}} as u on t.user_id = u.id
{% if is_incremental() %}
where
    t.id > (select max(id) from {{ this }})
order by
    t.id
limit
    75000
{% else %}
where
    t.id <= 75000
{% endif %}