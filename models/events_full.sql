select
    ec.user_id,
    ec.timestamp,
    ec.type_id,
    et.type
from {{ref("events_clean")}} ec
left join {{ref("event_types")}} et on et.type_id::smallint = ec.type_id