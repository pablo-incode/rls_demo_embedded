select 
    orgs.apikey,
    orgs.clientid,
    tree.id,
    tree.parentorganizationid
from {{ source('glue_demo', 'orgs') }} orgs
        left join {{ ref('src_demo_organization_tree') }} tree
      on orgs._id=tree.id
WHERE orgs.clientid not in (select rejected_client from {{ ref('seed_demo_rejected_clients') }} )