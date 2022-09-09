{% for year in var('assessment_years') %}
    {{ log("Year: " ~ year) }}

    {% set table_name = 'assessments_' ~ year | string ~ '_common' %}
    {{ log("Table Name: " ~ table_name) }}

    select
        cast(living_area as FLOAT64) as living_area,
        cast(st_name as STRING) as st_name,
        cast(unit_num as STRING) as unit_num,
        cast(lu as STRING) as lu,
        cast(st_num as STRING) as st_num,
        cast(yr_built as FLOAT64) as yr_built,
        cast(own_occ as STRING) as own_occ,
        cast(owner as STRING) as owner,
        cast(zipcode as STRING) as zipcode,
        cast(land_sf as FLOAT64) as land_sf,
        cast(cm_id as STRING) as cm_id,
        cast(gross_area as FLOAT64) as gross_area,
        cast(year as INT64) as year
    from
        {{ source('dtc_final_project', table_name) }}

    {% if not loop.last %}
    union all
    {% endif %}

{% endfor %}
