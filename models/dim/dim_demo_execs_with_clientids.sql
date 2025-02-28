{{ config(
    dist='clientid',
    sort=['clientid','apikey']
) }}
select case when replace(replace(replace(org, ']', ''),'"',''),'[','') = '' then org.clientid
            else  replace(replace(replace(org, ']', ''),'"',''),'[','')
       end as clientid,
       exec.email,
       exec.apikey
from {{ ref('dim_demo_execs_split_orgs') }}  exec
inner join {{ ref('src_demo_organizations') }}  as org
      on exec.apikey = org.apikey
where not case when replace(replace(replace(org, ']', ''),'"',''),'[','') = '' then org.clientid
            else  replace(replace(replace(org, ']', ''),'"',''),'[','')
       end is null