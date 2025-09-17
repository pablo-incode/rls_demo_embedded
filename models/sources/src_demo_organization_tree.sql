select 
    id_oid id,
    parentorganizationid
from {{ source('dev', 'organizations_child') }}