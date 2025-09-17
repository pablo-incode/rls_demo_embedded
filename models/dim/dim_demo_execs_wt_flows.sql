{{ config(
    dist='clientid',
    sort=['clientid','email','name']
) }}

select distinct flow.clientid, exec.email,  flow.name
from {{ ref('dim_demo_execs_with_clientids') }} as exec
inner join {{ ref('dim_demo_flow_names_wtparents') }} as flow
      on exec.apikey = flow.apikey
      or exec.clientid = flow.clientid
where not flow.clientid is null
