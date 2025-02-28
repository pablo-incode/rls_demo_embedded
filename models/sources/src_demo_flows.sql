select  
    _id, 
    name, 
    apikey
from {{source('glue_demo','flows')}}
where _createdat >= 1672531200000 --Jan2023 