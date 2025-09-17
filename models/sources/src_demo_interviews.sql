select distinct
    apikey,
    configurationname,
    configurationid,
    clientid
from {{ source('glue_demo', 'interviews') }}
WHERE _createdat >= 1672531200000