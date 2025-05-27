-- 26/05/2025

-- Exemplos básicos de consultas DQL usando `SELECT`:

-- 1. **Selecionar todos os registros de uma tabela**:
   SELECT * FROM pacientes;
--    Isso retorna todos os dados armazenados na tabela `pacientes`.

2. **Selecionar colunas específicas**:
   SELECT nome, idade FROM pacientes;
--    Aqui, estamos buscando apenas os valores das colunas `nome` e `idade`.

-- 3. **Filtrar dados com `WHERE`**:
   SELECT * FROM pacientes WHERE idade > 40;
--    Retorna somente os pacientes com mais de 40 anos.

-- 4. **Ordenar os resultados**:
   SELECT nome, idade FROM pacientes ORDER BY idade DESC;
--    Mostra os pacientes organizados pela idade, do maior para o menor.

-- Esses comandos são fundamentais para consultar dados em um banco.
--  Como o seu repositório parece ter um banco de dados hospitalar, 
--  você quer exemplos mais específicos para esse contexto?

-- Exemplos de consultas DQL específicas para o contexto hospitalar:

SELECT * FROM gh_tblpacientes AS P
INNER JOIN gh_tblprontuarios AS PR ON P.id_paciente = PR.id_paciente

SELECT * FROM gh_tblpacientes AS P
LEFT JOIN gh_tblprontuarios AS PR ON P.id_paciente = PR.id_paciente

SELECT * FROM gh_tblpacientes AS P
RIGHT JOIN gh_tblprontuarios AS PR ON P.id_paciente = PR.id_paciente

SELECT 
    gh_tblpacientes.id_paciente,
    gh_tblpacientes.nome,
    gh_tblpacientes.sobrenome,
    gh_tblpacientes.data_nascimento,
    gh_tblgeneros.descricao AS genero,
    gh_tblprontuarios.id_prontuario,
    gh_tblprontuarios.descricao AS descricao_prontuario
FROM gh_tblpacientes
INNER JOIN gh_tblgeneros ON gh_tblpacientes.id_genero = gh_tblgeneros.id_genero
INNER JOIN gh_tblprontuarios ON gh_tblpacientes.id_paciente = gh_tblprontuarios.id_paciente

--- VAMOS PRATICAR 

-- MONTAR UMA CONSULTA QUE TRAGA OS EXAMES DE PACIENTES E SEUS GENEROS 
-- PACIENTES (ID_PACIENTE) (ID_GENERO) / EXAMES (ID_PACIENTE) / GENEROS (ID_GENERO)

USE gestao_hospitalar;

SELECT 
    gh_tblpacientes.id_paciente,                -- Seleciona o ID único do paciente
    gh_tblpacientes.nome,                       -- Seleciona o nome (primeiro nome) do paciente
    gh_tblpacientes.sobrenome,                  -- Seleciona o sobrenome do paciente
    gh_tblgeneros.descricao AS genero,          -- Seleciona a descrição do gênero (masculino, feminino, etc.), renomeando para 'genero'
    gh_tblexames.id_exame,                      -- Seleciona o ID único do exame
    gh_tblexames.diagnostico AS descricao_exame -- Seleciona o diagnóstico do exame, renomeando para 'descricao_exame'
FROM gh_tblpacientes                            -- Define a tabela principal da consulta: pacientes
INNER JOIN gh_tblgeneros                        -- Faz junção com a tabela de gêneros
    ON gh_tblpacientes.id_genero = gh_tblgeneros.id_genero  -- Condição da junção: o gênero do paciente deve existir na tabela de gêneros
INNER JOIN gh_tblexames                         -- Faz junção com a tabela de exames
    ON gh_tblpacientes.id_paciente = gh_tblexames.id_paciente; -- Condição da junção: retorna apenas pacientes que possuem exames


| id_paciente |   nome   | sobrenome |   genero   | id_exame |              descricao_exame                   |
|-------------|----------|-----------|------------|----------|------------------------------------------------|
|      1      |  Fulano  |   Silva   | Masculino  |    1     | Exame de sangue realizado, resultados normais. |

-- SCRIPT DO PROFESSOR 

SELECT * FROM gh_tblpacientes
INNER JOIN gh_tblgeneros ON gh_tblpacientes.id_genero = gh_tblgeneros.id_genero
INNER JOIN gh_tblexames ON gh_tblpacientes.id_paciente = gh_tblexames.id_paciente;


