-------------------------------------------------------
-- Atividade 12-05-25 | minoru-yamanaka

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