-- Seleciona o banco de dados onde as operações serão realizadas
USE gestao_hospitalar;

-- Inserção de registros na tabela de pacientes
-- Cada linha adiciona um novo paciente com informações básicas como nome, data de nascimento e gênero
INSERT INTO gh_tblpacientes (id_paciente, nome, sobrenome, data_nascimento, id_genero, data_cadastro) 
VALUES 
(1, 'Fulano', 'Silva', '1971-08-12', 1, '2025-05-05 20:52:31'),
(3, 'Fulano01', 'Silva01', '1971-08-12', 1, '2025-05-05 20:57:04'),
(4, 'Fulano02', 'Silva02', '1971-08-12', 1, '2025-05-05 20:57:04'),
(5, 'Fulano03', 'Silva03', '1971-08-12', 1, '2025-05-05 20:57:04'),
(6, 'Fulano04', 'Silva04', '1971-08-12', 1, '2025-05-05 20:57:04'),
(7, 'Fulano05', 'Silva05', '1971-08-12', 1, '2025-05-05 20:57:04');

-- Inserção de registros na tabela de médicos
-- Cada linha adiciona um médico com CRM, estado e data de cadastro
-- Alguns médicos têm IDs duplicados em outra faixa de valores, possivelmente para testes ou ambientes diferentes
INSERT INTO gh_tblmedicos (id_medico, nome, sobrenome, crm, uf, data_cadastro)
VALUES
(1, 'Medico01', 'Medico01', '123456', 'SP', '2025-05-05 21:09:06'),
(2, 'Medico02', 'Medico02', '234567', 'SP', '2025-05-05 21:09:07'),
(3, 'Medico03', 'Medico03', '345678', 'SP', '2025-05-05 21:09:07'),
(4, 'Medico04', 'Medico04', '456789', 'SP', '2025-05-05 21:09:07'),
(5, 'Medico05', 'Medico05', '567890', 'SP', '2025-05-05 21:09:07'),
(10, 'Medico01', 'Medico01', '123456', 'SP', '2025-05-05 21:46:58'),
(11, 'Medico02', 'Medico02', '234567', 'SP', '2025-05-05 21:46:58'),
(12, 'Medico03', 'Medico03', '345678', 'SP', '2025-05-05 21:46:58'),
(13, 'Medico04', 'Medico04', '456789', 'SP', '2025-05-05 21:46:58'),
(14, 'Medico05', 'Medico05', '567890', 'SP', '2025-05-05 21:46:58');

-- Inserção de exames realizados pelos pacientes com os médicos
-- Cada exame inclui um diagnóstico, a data do exame e a data atual como data de cadastro
INSERT INTO gh_tblExames (id_paciente, id_medico, diagnostico, data_exame, data_cadastro)
VALUES
(1, 1, 'Exame de sangue realizado, resultados normais.', '2025-05-01 08:30:00', NOW()),
(3, 2, 'Radiografia de tórax, sem anormalidades.', '2025-05-02 09:15:00', NOW()),
(4, 3, 'Ultrassonografia abdominal, fígado saudável.', '2025-05-03 10:45:00', NOW()),
(5, 4, 'Eletrocardiograma, sinais de ritmo cardíaco normal.', '2025-05-04 11:30:00', NOW()),
(6, 5, 'Tomografia computadorizada, sem lesões detectadas.', '2025-05-05 13:00:00', NOW());

-- Inserção de registros de prontuário médico dos pacientes
-- Cada registro representa uma anotação no prontuário, vinculada a um paciente
INSERT INTO gh_tblprontuarios (id_paciente, descricao, data_cadastro) 
VALUES 
(3, 'Paciente realizou exames de rotina.', NOW()),
(4, 'Paciente realizou exames de rotina.', NOW()),
(5, 'Paciente realizou exames de rotina.', NOW()),
(6, 'Paciente realizou exames de rotina.', NOW()),
(7, 'Paciente realizou exames de rotina.', NOW());
