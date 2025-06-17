# Atividade Pratica - Banco de Dados MySQL: Escola de Idiomas

## Contexto Geral

Voce foi contratado para desenvolver o banco de dados de uma Escola de Idiomas.
O sistema precisa armazenar informacoes sobre Alunos, Cursos, Turmas e Matriculas.


## Parte 1 - Modelagem MER

**1. Identifique as entidades, atributos e relacionamentos necessarios.**

```` 
Alunos <-- [entidade]
[atributos] --> (id_aluno, nome, data_nascimento, cpf, email, telefone)
-- 
Cursos <-- [entidade]
[atributos] --> (id_curso, nome_curso, descricao, carga_horaria)
--
Turmas <-- [relacionamento necessarios]
[atributos] --> (id_turma, id_curso, horario, professor, data_inicio, data_fim)
--
Matrículas <-- [relacionamento necessarios]
[atributos] -->  (id_matricula, id_aluno, id_turma, data_matricula, status)
````

**1. Defina a cardinalidade entre as entidades.**
   
````
   Alunos -- [1:N] -- Matriculas
   Cursos -- [1:N] -- Turmas
   Turmas -- [1:N] -- Matrículas 
   Alunos -- [N:M] -- Turmas
````
   
**2. Monte o Diagrama ER (MER).**

````
   Alunos <--[1:N]--> Matriculas <--[N:1]--> Turmas <--[1:N]--> Cursos 
````

````
   Alunos<--[N:M]-->Turmas
````

## Parte 2 - Criacao do Banco de Dados

**1. Escreva os comandos SQL (DDL) para criar as tabelas necessarias no MySQL.**

````sql
CREATE DATABASE Escola_de_Idiomas;
USE Escola_de_Idiomas;

CREATE TABLE Alunos (
    id_aluno INT,
    nome VARCHAR(100),
    data_nascimento DATE,
    cpf VARCHAR(14),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Cursos (
    id_curso INT,
    nome_curso VARCHAR(100),
    descricao TEXT,
    carga_horaria INT
);

CREATE TABLE Turmas (
    id_turma INT,
    id_curso INT,
    horario VARCHAR(50),
    professor VARCHAR(100),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE Matriculas (
    id_matricula INT,
    id_aluno INT,
    id_turma INT,
    data_matricula DATE,
    status VARCHAR(20)
);
````
   
**2. Inclua chaves primarias e estrangeiras.**
   
````sql
USE Escola_de_Idiomas;

ALTER TABLE Alunos ADD PRIMARY KEY (id_aluno);
ALTER TABLE Cursos ADD PRIMARY KEY (id_curso);
ALTER TABLE Turmas ADD PRIMARY KEY (id_turma);
ALTER TABLE Matriculas ADD PRIMARY KEY (id_matricula);

ALTER TABLE Turmas ADD FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso);
ALTER TABLE Matriculas ADD FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno);
ALTER TABLE Matriculas ADD FOREIGN KEY (id_turma) REFERENCES Turmas(id_turma);
````

**1. Defina os tipos de dados adequados para cada campo.**

````sql

-- CREATE DATABASE Escola_de_Idiomas;
-- USE Escola_de_Idiomas;

-- Tabela: Alunos
CREATE TABLE Alunos (
    id_aluno INT, -- Id do aluno
    nome VARCHAR(100), -- Nome completo do aluno
    data_nascimento DATE, -- Data de nascimento
    cpf VARCHAR(14), -- CPF
    email VARCHAR(100), -- E-mail
    telefone VARCHAR(20) -- Telefone
);

-- Tabela: Cursos
CREATE TABLE Cursos (
    id_curso INT, -- Id do curso
    nome_curso VARCHAR(100), -- Nome do curso
    descricao TEXT, -- Descrição do curso
    carga_horaria INT -- Carga horária do curso
);

-- Tabela: Turmas
CREATE TABLE Turmas (
    id_turma INT, -- Id da turma
    id_curso INT, -- Id do curso relacionado a turma 
    horario VARCHAR(50), -- Horário da turma ["Segunda e Quarta - 19h às 21h"]
    professor VARCHAR(100), -- Nome do professor responsável
    data_inicio DATE, -- Data de início da turma
    data_fim DATE -- Data de encerramento da turma
);

-- Tabela: Matrículas
CREATE TABLE Matriculas (
    id_matricula INT, -- Id matrícula
    id_aluno INT, -- Id Aluno matriculado
    id_turma INT, -- Id da turma que o aluno está matriculado
    data_matricula DATE, -- Data da matrícula
    status VARCHAR(20) -- Status da matrícula [Ativo, Cancelado, Concluído]
);
````

## Parte 3 - Situacoes-Problema para INSERTS
**Situacao 3.1: Cadastre dois cursos:**

**- Ingles Basico com 60 horas**
  
**- Espanhol Intermediario com 80 horas**

````sql
USE Escola_de_Idiomas;
INSERT INTO Cursos (id_curso, nome_curso, descricao, carga_horaria) VALUES
(1, 'Inglês Básico', 'Curso introdutório de inglês para iniciantes.', 60),
(2, 'Espanhol Intermediário', 'Curso focado em conversação e gramática intermediária.', 80);
````

**Situacao 3.2: Cadastre dois alunos:**

**- Maria Silva, nascimento: 10/05/2000, telefone: 11999999999**

**- Joao Souza, nascimento: 22/08/1998, telefone: 11988888888**

````sql
USE Escola_de_Idiomas;
INSERT INTO Alunos (id_aluno, nome, data_nascimento, cpf, email, telefone) VALUES
(1, 'Maria Silva', '2000-05-10', '000.000.000-00', 'maria.silva@email.com', '11999999999'),
(2, 'João Souza', '1998-08-22', '111.111.111-11', 'joao.souza@email.com', '11988888888');
````

**Situacao 3.3: Crie duas turmas:**

**- Uma para o curso de Ingles**
  
**-  Uma para o curso de Espanhol
(Informe data de inicio, horario e nivel)**

````sql
USE Escola_de_Idiomas;
INSERT INTO Turmas (id_turma, id_curso, horario, professor, data_inicio, data_fim) VALUES
(1, 1, 'Segunda e Quarta - 19h30 às 21h30', 'Carlos Mendes', '2025-02-03', '2025-06-27'),
(2, 2, 'Terça e Quinta - 19h30 às 21h30', 'Ana Rodríguez', '2025-02-04', '2025-06-27');
````

**Situacao 3.4: Realize as matriculas:**

**- Maria Silva na turma de Ingles**
  
**- Joao Souza na turma de Espanhol**

````sql
USE Escola_de_Idiomas;
INSERT INTO Matriculas (id_matricula, id_aluno, id_turma, data_matricula, status) VALUES
(1, 1, 1, '2025-06-16', 'Ativo'),
(2, 2, 2, '2025-06-16', 'Ativo');
````

## Parte 4 - Consultas (SELECT)

**1. Liste todos os alunos com o nome das turmas, incluindo horario e nivel.**
   
````sql
USE Escola_de_Idiomas;
SELECT * FROM Cursos;
````

**2. Exiba todos os cursos oferecidos.**

````sql
USE Escola_de_Idiomas;
SELECT * FROM Cursos;
````

**1. Liste alunos matriculados em turmas de nivel 'Basico'.**

````sql
USE Escola_de_Idiomas;
SELECT * FROM Cursos WHERE nome_curso LIKE '%Básico%';
````

## Parte 5 - Situacoes-Problema para UPDATE

**Situacao 5.1: Atualizar o telefone de Maria Silva para: 11977777777**

**Situacao 5.2: Alterar o horario da turma de Ingles para 18:00**

````sql
USE Escola_de_Idiomas;

UPDATE Alunos 
SET telefone = '11977777777' 
WHERE nome = 'Maria Silva';

UPDATE Alunos 
SET telefone = '11977777777' 
WHERE nome = 'Maria Silva';
````

**Situacao 5.3: Cadastrar um novo aluno:**

- Lucas Pereira, nascimento: 12/12/2001, e matricula-lo na turma de Espanhol.

````sql
USE Escola_de_Idiomas;

-- Inserir Lucas na tabela Alunos
INSERT INTO Alunos (id_aluno, nome, data_nascimento, cpf, email, telefone) VALUES
(3, 'Lucas Pereira', '2001-12-12', '222.222.222-22', 'lucas.pereira@email.com', '11966666666');

-- Matricular Lucas na turma de Espanhol
INSERT INTO Matriculas (id_matricula, id_aluno, id_turma, data_matricula, status) VALUES
(3, 3, 2, '2025-06-16', 'Ativo');
````

## Parte 6 - Desafio Final

**1. Listar alunos nascidos depois de 1999.**

````sql
USE Escola_de_Idiomas;

SELECT * FROM Alunos 
WHERE data_nascimento > '1999-12-31';
````

**2. Listar todas as turmas com o nome do curso correspondente.**

````sql
USE Escola_de_Idiomas;
-- T de Turmas, C de Cursos
SELECT T.id_turma, C.nome_curso,  T.horario, T.professor, T.data_inicio, T.data_fim
-- inner join 
FROM Turmas T
JOIN Cursos C ON T.id_curso = C.id_curso;
````
   
**3. Contar o numero de alunos por turma (usar COUNT e GROUP BY).**

```` sql
USE Escola_de_Idiomas;

SELECT T.id_turma, C.nome_curso, COUNT(M.id_aluno) AS total_alunos
FROM Turmas T
JOIN Cursos C ON T.id_curso = C.id_curso
LEFT JOIN Matriculas M ON T.id_turma = M.id_turma
GROUP BY T.id_turma, C.nome_curso;
````

## Entregaveis
- Diagrama MER desenhado
- Script de criacao das tabelas (DDL)
- Scripts dos INSERTs e UPDATEs
- Consultas (SELECT)
- Resposta do Desafio Final
