select 
    _id,
    name,
    apikey
from {{ source('glue_demo', 'flows') }}
WHERE _createdat >= 1672531200000