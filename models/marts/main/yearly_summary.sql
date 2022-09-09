with

assessments_common as (
    select * from {{ ref('assessments_common') }}
)

select
    year,
    count(*) as n_assessments
from
    assessments_common
group by
    1