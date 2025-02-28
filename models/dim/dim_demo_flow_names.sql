{{ config(
    dist='clientid',
    sort=['clientid','apikey']
) }}

select distinct
    COALESCE(flows.name,t1.configurationname, 'Onboarding') as name,
    t1.clientid,
    t1.apikey
    from {{ ref('src_demo_interviews') }}  as t1
    inner join {{ ref('src_demo_organizations') }} as org
                  on t1.apikey = org.apikey
    left join {{ ref('src_demo_flows') }} as flows
            ON CAST(t1.configurationid AS VARCHAR) = CAST(flows._id AS VARCHAR)
