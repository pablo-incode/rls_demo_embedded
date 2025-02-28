select 
    apikey, 
    clientid
from {{source('glue_demo','orgs')}}
where clientid not in (
    select rejected_client from {{ ref('seed_demo_rejected_clients')}} )

