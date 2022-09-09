{% for year in var('assessment_years') %}
    {{ log("Year: " ~ year) }}

    {% set table_name = 'assessments_' ~ year | string ~ '_common' %}
    {{ log("Table Name: " ~ table_name) }}

    select
        *
    from
        {{ source('dtc_final_project', table_name) }}

    {% if not loop.last %}
    union all
    {% endif %}

{% endfor %}
