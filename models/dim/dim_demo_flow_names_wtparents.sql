{{ config(
    dist='clientid',
    sort=['clientid','apikey']
) }}

select distinct
    name,
    clientid,
    apikey
from {{ ref('dim_demo_flow_names') }}  as t_childs

UNION all

select distinct
    t_childs.name,
    t_parents.clientid,
    t_parents.apikey
from {{ ref('dim_demo_flow_names') }}  as t_childs
INNER JOIN {{ ref('src_demo_organizations') }} t_parents
    ON t_childs.parentorganizationid = t_parents.id