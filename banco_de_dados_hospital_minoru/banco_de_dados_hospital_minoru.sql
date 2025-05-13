-- page.sql

-- Aula 01: Criação de Banco de Dados e Tabelas

-- Comentários de uma linha
/*
 Comentário de mais de uma 
 linha
*/

-- DDL: CREATE / ALTER / DROP
CREATE DATABASE IF NOT EXISTS gestao_hospitalar;
USE gestao_hospitalar;

-- Criação das tabelas
CREATE TABLE IF NOT EXISTS gh_tblGeneros (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(30) NOT NULL,
    data_cadastro DATETIME
);

CREATE TABLE IF NOT EXISTS gh_tblPacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    data_nascimento DATE NOT NULL,
    id_genero INT NOT NULL,
    data_cadastro DATETIME
);

CREATE TABLE IF NOT EXISTS gh_tblMedicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    crm INT NOT NULL,
    uf CHAR(2) NOT NULL,
    data_cadastro DATETIME
);

CREATE TABLE IF NOT EXISTS gh_tblExames (
    id_exame INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    diagnostico TEXT,
    data_exame DATETIME,
    data_cadastro DATETIME
);

CREATE TABLE IF NOT EXISTS gh_tblProntuarios (
    id_prontuario INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    descricao TEXT NOT NULL,
    data_cadastro DATETIME
);

-- Aula 02: Relacionamentos e Inserções

-- Relacionamentos (chaves estrangeiras)
ALTER TABLE gh_tblPacientes 
ADD FOREIGN KEY (id_genero) 
REFERENCES gh_tblGeneros(id_genero);

ALTER TABLE gh_tblProntuarios 
ADD FOREIGN KEY (id_paciente) 
REFERENCES gh_tblPacientes(id_paciente);

ALTER TABLE gh_tblExames 
ADD FOREIGN KEY (id_paciente) 
REFERENCES gh_tblPacientes(id_paciente);

ALTER TABLE gh_tblExames 
ADD FOREIGN KEY (id_medico) 
REFERENCES gh_tblMedicos(id_medico);

-- Inserção de dados iniciais

-- Inserção de gêneros
INSERT INTO gh_tblGeneros (descricao, data_cadastro) 
VALUES ('Masculino', NOW()), ('Feminino', NOW());

-- Inserção de pacientes
INSERT INTO gh_tblPacientes (id_paciente, nome, sobrenome, data_nascimento, id_genero, data_cadastro) 
VALUES 
(1, 'Fulano', 'Silva', '1971-08-12', 1, '2025-05-05 20:52:31'),
(3, 'Fulano01', 'Silva01', '1971-08-12', 1, '2025-05-05 20:57:04'),
(4, 'Fulano02', 'Silva02', '1971-08-12', 1, '2025-05-05 20:57:04'),
(5, 'Fulano03', 'Silva03', '1971-08-12', 1, '2025-05-05 20:57:04'),
(6, 'Fulano04', 'Silva04', '1971-08-12', 1, '2025-05-05 20:57:04'),
(7, 'Fulano05', 'Silva05', '1971-08-12', 1, '2025-05-05 20:57:04');

-- Inserção de médicos
INSERT INTO gh_tblMedicos (id_medico, nome, sobrenome, crm, uf, data_cadastro)
VALUES
(1, 'Medico01', 'Medico01', 123456, 'SP', '2025-05-05 21:09:06'),
(2, 'Medico02', 'Medico02', 234567, 'SP', '2025-05-05 21:09:07'),
(3, 'Medico03', 'Medico03', 345678, 'SP', '2025-05-05 21:09:07'),
(4, 'Medico04', 'Medico04', 456789, 'SP', '2025-05-05 21:09:07'),
(5, 'Medico05', 'Medico05', 567890, 'SP', '2025-05-05 21:09:07'),
(10, 'Medico01', 'Medico01', 123456, 'SP', '2025-05-05 21:46:58'),
(11, 'Medico02', 'Medico02', 234567, 'SP', '2025-05-05 21:47:00');

-- Inserção de exames
INSERT INTO gh_tblExames (id_paciente, id_medico, diagnostico, data_exame, data_cadastro)
VALUES
(1, 1, 'Exame de sangue realizado, resultados normais.', '2025-05-01 08:30:00', NOW()),
(2, 2, 'Radiografia de tórax, sem anormalidades.', '2025-05-02 09:15:00', NOW()),
(3, 3, 'Ultrassonografia abdominal, fígado saudável.', '2025-05-03 10:45:00', NOW()),
(4, 4, 'Eletrocardiograma, sinais de ritmo cardíaco normal.', '2025-05-04 11:30:00', NOW()),
(5, 5, 'Tomografia computadorizada, sem lesões detectadas.', '2025-05-05 13:00:00', NOW());

-- Inserção de prontuários
INSERT INTO gh_tblProntuarios (id_paciente, descricao, data_cadastro) 
VALUES 
(3, 'Paciente realizou exames de rotina.', NOW()),
(4, 'Paciente realizou exames de rotina.', NOW()),
(5, 'Paciente realizou exames de rotina.', NOW()),
(6, 'Paciente realizou exames de rotina.', NOW()),
(7, 'Paciente realizou exames de rotina.', NOW());
