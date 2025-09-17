{{ config(
    dist='clientid',
    sort=['clientid','apikey']
) }}

select distinct
    COALESCE(flows.name,t1.configurationname, 'Onboarding') as name,
    t1.clientid,
    t1.apikey,
    org.id org_id,
    org.parentorganizationid
    from {{ ref('src_demo_interviews') }}  as t1
    inner join {{ ref('src_demo_organizations') }} as org
                  on t1.apikey = org.apikey
    left join {{ ref('src_demo_flows') }} as flows
            on t1.configurationid = flows._id
