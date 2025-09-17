select distinct clientid, email, name
FROM {{ ref('dim_demo_execs_wt_flows') }} as dim_exec_wt_flow
UNION
select clientid, email, name
FROM {{ ref('dim_demo_incode_wt_flow') }} as dim_incode_wt_flow