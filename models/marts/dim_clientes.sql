with 
    clientes as(
    select *
    from {{ ref('stg_erp__clientes') }}
)

    , transformacoes as (
        select
            row_number() over (order by id_cliente) as sk_cliente
            , id_cliente
            , empresa_cliente
            , nome_cliente
            , endereco_cliente
            , cidade_cliente
            , regiao_cliente
            , cep_cliente
            , pais_cliente
        from clientes

)

select *
from transformacoes