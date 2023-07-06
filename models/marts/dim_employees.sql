with
-- 1o se chama as tabelas que se vai usar (employees e managers):
-- 3o se traz o nome das colunas (prof puxou 1o para employee para ver os nomes das colunas; depois colocou em mnagers)
    erp_employees as (
        select
            funcionario_id
            , gerente_id 		
            , sobrenome	
            , nome
            , nome_completo				
            , data_nascimento
            , data_contratacao
            , endereco
            , cidade	
            , regiao		
            , cep						
            , pais			
            , notas	
        from {{ ref('stg_erp__employees') }}
    )

-- Aqui se chama a mesma tabela, mas como managers (não é preciso fazer isso, prof fez para entender melhor - as 2 tabelas são = )
    , erp_managers as (
        select *
        from {{ ref('stg_erp__employees') }}
    )

-- 2o se junta as tabelas
-- 3o se traz o nome das colunas (é de boa prática relacionar as colunas a tabela de onde elas vieram)
    , join_employee_to_managers as (
        select
            erp_employees.funcionario_id
            , erp_employees.gerente_id 		
            , erp_employees.sobrenome	
            , erp_employees.nome
            , erp_employees.nome_completo
            , erp_managers.nome_completo as gerente_nome_completo
            , erp_employees.data_nascimento
            , erp_employees.data_contratacao
            , erp_employees.endereco
            , erp_employees.cidade	
            , erp_employees.regiao		
            , erp_employees.cep						
            , erp_employees.pais			
            , erp_employees.notas	
        from erp_employees
    -- Ordem: 1 funcionario se relaciona com 1 gerente
        left join erp_managers on erp_employees.gerente_id = erp_managers.funcionario_id
    )

-- 4o Select para fechar, indicando que a tabela final gerada será o resultado desse modelo (join employees_to_manager)
select *
from join_employee_to_managers

-- É de boa prática deixar um linha extra pós código;