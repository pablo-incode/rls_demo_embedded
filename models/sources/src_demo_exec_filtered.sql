select 
    apikey,
    email,
    organizations_json,
    type,
    _updatedat
from {{ source('glue_demo', 'exec') }}
WHERE type in (select admitted_type from {{ ref('seed_demo_exec_admitted_types') }} )
    and email is not null 
    and email <> 'dummy'