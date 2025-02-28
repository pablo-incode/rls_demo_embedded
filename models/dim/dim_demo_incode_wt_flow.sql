-- depends_on: {{ ref('dim_demo_flow_baseline') }}
-- depends_on: {{ ref('seed_demo_accepted_tableau_lics') }}

{% set fetch_operations_query %}
SELECT email FROM {{ ref('seed_demo_accepted_tableau_lics') }} as tableu_users
{% endset %}

{% set results = run_query(fetch_operations_query) %}

{% if execute %}
  {% set results_list = results.rows %}
{% else %}
  {% set results_list = [] %}
{% endif %}

{% for row in results_list %}
    select clientid, '{{ row[0] }}' as email,name
    from {{ ref('dim_demo_flow_baseline') }} as flow_names
  {% if not loop.last %}
  union all
  {% endif %}
{% endfor %}