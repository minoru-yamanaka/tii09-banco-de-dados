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
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS gh_tblPacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    data_nascimento DATE NOT NULL,
    id_genero INT NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_genero) REFERENCES gh_tblGeneros(id_genero)
);

CREATE TABLE IF NOT EXISTS gh_tblMedicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    crm INT NOT NULL,
    uf CHAR(2) NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS gh_tblExames (
    id_exame INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    diagnostico TEXT,
    data_exame DATETIME,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_paciente) REFERENCES gh_tblPacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES gh_tblMedicos(id_medico)
);

CREATE TABLE IF NOT EXISTS gh_tblProntuarios (
    id_prontuario INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    descricao TEXT NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_paciente) REFERENCES gh_tblPacientes(id_paciente)
);

-- Aula 02: Inserções

-- Inserção de gêneros
INSERT INTO gh_tblGeneros (descricao) 
VALUES ('Masculino'), ('Feminino');

-- Inserção de pacientes
INSERT INTO gh_tblPacientes (nome, sobrenome, data_nascimento, id_genero, data_cadastro) 
VALUES 
('Fulano', 'Silva', '1971-08-12', 1, '2025-05-05 20:52:31'),
('Fulano01', 'Silva01', '1971-08-12', 1, '2025-05-05 20:57:04'),
('Fulano02', 'Silva02', '1971-08-12', 1, '2025-05-05 20:57:04'),
('Fulano03', 'Silva03', '1971-08-12', 1, '2025-05-05 20:57:04'),
('Fulano04', 'Silva04', '1971-08-12', 1, '2025-05-05 20:57:04'),
('Fulano05', 'Silva05', '1971-08-12', 1, '2025-05-05 20:57:04');

-- Inserção de médicos
INSERT INTO gh_tblMedicos (nome, sobrenome, crm, uf, data_cadastro)
VALUES
('Medico01', 'Medico01', 123456, 'SP', '2025-05-05 21:09:06'),
('Medico02', 'Medico02', 234567, 'SP', '2025-05-05 21:09:07'),
('Medico03', 'Medico03', 345678, 'SP', '2025-05-05 21:09:07'),
('Medico04', 'Medico04', 456789, 'SP', '2025-05-05 21:09:07'),
('Medico05', 'Medico05', 567890, 'SP', '2025-05-05 21:09:07'),
('Medico06', 'Medico06', 678901, 'SP', '2025-05-05 21:46:58'),
('Medico07', 'Medico07', 789012, 'SP', '2025-05-05 21:47:00');

-- Inserção de exames
INSERT INTO gh_tblExames (id_paciente, id_medico, diagnostico, data_exame)
VALUES
(1, 1, 'Exame de sangue realizado, resultados normais.', '2025-05-01 08:30:00'),
(2, 2, 'Radiografia de tórax, sem anormalidades.', '2025-05-02 09:15:00'),
(3, 3, 'Ultrassonografia abdominal, fígado saudável.', '2025-05-03 10:45:00'),
(4, 4, 'Eletrocardiograma, sinais de ritmo cardíaco normal.', '2025-05-04 11:30:00'),
(5, 5, 'Tomografia computadorizada, sem lesões detectadas.', '2025-05-05 13:00:00');

-- Inserção de prontuários
-- Atenção: paciente id 7 não existe (verificar antes de executar ou ajustar dados)
INSERT INTO gh_tblProntuarios (id_paciente, descricao) 
VALUES 
(3, 'Paciente realizou exames de rotina.'),
(4, 'Paciente realizou exames de rotina.'),
(5, 'Paciente realizou exames de rotina.'),
(6, 'Paciente realizou exames de rotina.');
-- Removido o paciente 7, pois ele não foi previamente inserido

