{{ config(materialized='ephemeral') }}

with prep AS (
  select 1 as n union all
  select 2 union all
  select 3 union all
  select 4 union all
  select 5 union all
  select 6 union all
  select 7 union all
  select 8 union all
  select 9 union all
  select 10 union all
  select 11 union all
  select 12 union all
  select 13 union all
  select 14 union all
  select 15 union all
  select 16 union all
  select 17 union all
  select 18 union all
  select 19 union all
  select 20 union all
  select 21 union all
  select 22 union all
  select 23 union all
  select 24 union all
  select 25 union all
  select 26 union all
  select 27 union all
  select 28 union all
  select 29 union all
  select 30
)

select 
    apikey,
    email,
    coalesce(TRIM(SPLIT_PART(exec.organizations_json, ',', prep.n)),'') as org
from {{ ref('src_demo_exec_filtered') }} as exec
            left join prep
        on prep.n <= regexp_count(exec.organizations_json, ',') + 1