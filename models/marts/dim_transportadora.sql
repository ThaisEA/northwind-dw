with
    transportadoras as(
        select *
        from {{ ref('stg_erp__transportadoras') }}
    )

select *
from transportadoras