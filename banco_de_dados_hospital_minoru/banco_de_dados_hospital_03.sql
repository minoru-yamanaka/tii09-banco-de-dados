-- O comando INSERT adiciona um novo registro na tabela especificada.
-- Você deve fornecer os nomes das colunas e os valores correspondentes.
INSERT INTO nome_tabela (campo1, campo2) VALUES ('valor1', 'valor2');

-- O comando UPDATE altera os valores de um ou mais campos de um registro existente.
-- Sempre use WHERE para especificar quais registros devem ser atualizados, 
-- pois sem ele TODOS os registros serão modificados.
UPDATE nome_tabela 
SET campo = 'novo_valor', campo2 = 'novo_valor2' 
WHERE id = 1;

-- O comando DELETE remove um ou mais registros da tabela.
-- É essencial incluir a cláusula WHERE para evitar a remoção de todos os dados.
DELETE FROM nome_tabela WHERE id = 1;

-- O comando TRUNCATE apaga todos os registros da tabela de forma definitiva.
-- Ele também reinicia o contador de IDs, voltando ao valor inicial (geralmente 1).
-- Diferente do DELETE, que pode ser desfeito com ROLLBACK, TRUNCATE não pode ser revertido.
TRUNCATE TABLE nome_tabela;

USE gestao_hospitalar;

UPDATE gh_tblpacientes SET data_nascimento = '1971-08-13', sobrenome = "Martins" WHERE id_paciente = 3;

SELECT * FROM gh_tblpacientes;

-- A tabela gh_tblexames tem um campo id_paciente que está ligado à tabela gh_tblpacientes.
DELETE FROM gh_tblpacientes WHERE id_paciente = 3;
SELECT * FROM gh_tblpacientes;

-- Soluções possíveis
DELETE FROM gh_tblprontuarios WHERE id_paciente = 3;
DELETE FROM gh_tblpacientes WHERE id_paciente = 3;

DELETE FROM gh_tblexames WHERE id_paciente = 3;
DELETE FROM gh_tblpacientes WHERE id_paciente = 3;

-------------------------------------------------------
-- Atividade 
-- VAMOS PRATICAR

-- INSERIR NA TABELA:
--  - PACINETES 3 REGITROS
--  - MÉDICOS 3 REGISTROS
--  - PRONTUÁRIOS 3 REGISTROS
--  - EXAMES 3 REGISTROS

-- UPDATE:
--  - PACIENTES 2 REGISTROS
--  - MÉDICOS 2 REGISTROS
--  - EXAMES 2 REGISTROS

-- INSERT INTO nome_tabela (campos) VALUES (valores)
-- UPDATE nome_tabela SET campo = 'valor', campo2 = 123 WHERE id = 1
-------------------------------------------------------

-- INSERIR

-- PACINETES 3 REGITROS
USE gestao_hospitalar;
INSERT INTO gh_tblpacientes (nome, sobrenome, data_nascimento, id_genero, data_cadastro) 
VALUES 
('Fulano06', 'Silva06', '1971-08-13', 1, NOW()),
('Fulano07', 'Almeida07', '1985-02-25', 2, NOW()),
('Fulano08', 'Pereira08', '1993-11-10', 1, NOW());
SELECT * FROM gh_tblpacientes;

-- MÉDICOS 3 REGISTROS
USE gestao_hospitalar;
INSERT INTO gh_tblmedicos (nome, sobrenome, crm, UF, data_cadastro) 
VALUES 
('Medico11', 'Silva11', '123456', 'SP', NOW()),
('Medico12', 'Almeida12', '654321', 'RJ', NOW()),
('Medico13', 'Pereira13', '987654', 'MG', NOW());
SELECT * FROM gh_tblmedicos;

-- PRONTUÁRIOS 3 REGISTROS
USE gestao_hospitalar;

SELECT p.id_paciente, p.nome, p.sobrenome 
FROM gh_tblpacientes p
INNER JOIN gh_tblprontuarios pr ON p.id_paciente = pr.id_paciente;

INSERT INTO gh_tblprontuarios (id_paciente, descricao, data_cadastro)
VALUES 
(12, 'Prontuário de Fulano01', NOW()),
(13, 'Prontuário de Fulano02', NOW()),
(14, 'Prontuário de Fulano03', NOW());
SELECT * FROM gh_tblprontuarios;

-- EXAMES 3 REGISTROS
USE gestao_hospitalar;
INSERT INTO gh_tblexames (id_paciente, id_medico, diagnostico, data_exame, data_cadastro)
VALUES 
(12, 1, 'Exame de Sangue', '2025-05-02', NOW()),
(13, 2, 'Exame de Urina', '2025-05-03', NOW()),
(14, 3, 'Exame de Fezes', '2025-05-04', NOW());
SELECT * FROM gh_tblexames;

-- UPDATE

-- PACIENTES 2 REGISTROS
USE gestao_hospitalar;

UPDATE gh_tblpacientes 
SET sobrenome = 'Silva07'
WHERE id_paciente = 13;

UPDATE gh_tblpacientes 
SET sobrenome = 'Silva08'
WHERE id_paciente = 14;

SELECT * FROM gh_tblpacientes;

-- MÉDICOS 2 REGISTROS
USE gestao_hospitalar;

UPDATE gh_tblmedicos
SET sobrenome = 'Medico11'
WHERE id_medico = 15;

UPDATE gh_tblmedicos
SET sobrenome = 'Medico12'
WHERE id_medico = 13;

SELECT * FROM gh_tblmedicos;
 
-- EXAMES 2 REGISTROS
USE gestao_hospitalar;

UPDATE gh_tblexames
SET diagnostico = 'Teste de tolerância à glicose (TTG)'
WHERE id_exame = 14;

UPDATE gh_tblexames
SET diagnostico = 'Hemograma completo'
WHERE id_exame = 15;

SELECT * FROM gh_tblexames;
-------------------------------------------------------
