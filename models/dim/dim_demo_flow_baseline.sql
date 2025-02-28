select org.clientid, flow.name
from {{ ref('src_demo_exec_filtered') }} as exec
inner join {{ ref('src_demo_organizations') }} as org
      on exec.apikey = org.apikey
inner join {{ ref('dim_demo_flow_names') }} as flow
      on exec.apikey = flow.apikey
where not org.clientid is null