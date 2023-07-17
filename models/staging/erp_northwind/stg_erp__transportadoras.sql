with
    fonte_transportadora as(
        select
            cast(shipper_id as int) as id_transp
            , cast(company_name as string) as transp_cliente
            --, phone
        from {{ source('erp', 'shippers') }}
    )

select *
from fonte_transportadora